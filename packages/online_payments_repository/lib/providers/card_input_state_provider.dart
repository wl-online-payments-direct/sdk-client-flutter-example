/*
 * Do not remove or alter the notices in this preamble.
 *
 * This software is owned by Worldline and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *
 * Copyright © 2024 Worldline and/or its affiliates.
 *
 * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *
 * Please contact Worldline for questions regarding license and user rights.
 */
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:online_payments_repository/constants.dart' as constants;
import 'package:online_payments_repository/extensions/list_validation_error_message_extensions.dart';
import 'package:online_payments_repository/models/card_input.dart';
import 'package:online_payments_repository/models/result.dart';
import 'package:online_payments_repository/providers/payment_details_state_provider.dart';
import 'package:online_payments_repository/providers/payment_product_state_provider.dart';
import 'package:online_payments_repository/providers/session_state_provider.dart';
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_input_state_provider.g.dart';

/// Needs to remain alive throughout the whole app, because its input is used on multiple screens.
/// This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
@Riverpod(keepAlive: true)
class CardInputState extends _$CardInputState {
  @override
  CardInput build() {
    return CardInput(
      paymentProductResult: Result(),
      fieldsInput: {},
      validationErrorMessages: {},
    );
  }

  void getIinDetails(String partialCreditCardNumber) {
    final enteredIin = partialCreditCardNumber.substring(0, 6);

    if (state.lastRequestedIin == null ||
        enteredIin != state.lastRequestedIin) {
      // Only execute the IIN details call when the first six digits of the entered partialCreditCardNumber are not the same as the last requested IIN
      final session = ref.read(sessionStateProvider);
      final paymentContext =
          ref.read(paymentDetailsStateProvider).paymentContext;

      final request = IinDetailsRequest(
        paymentContext: paymentContext,
        partialCreditCardNumber: partialCreditCardNumber,
      );

      final listener = IinLookupResponseListener(
        onSuccess: _handleIinDetailsResponse,
        onError: _saveErrorResponse,
        onException: _saveNativeException,
      );

      state = state.copyWith(lastRequestedIin: enteredIin);

      session?.getIinDetails(request: request, listener: listener);
    }
  }

  ErrorResponse _createErrorResponse(String message) {
    return ErrorResponse(message);
  }

  void _handleIinDetailsResponse(IinDetailsResponse iinDetailsResponse) {
    switch (iinDetailsResponse.status) {
      case IinStatus.supported:
        ref.read(paymentProductStateProvider.notifier).getPaymentProduct(
              iinDetailsResponse.paymentProductId ?? "",
              null,
              onSuccess: (paymentProduct) =>
                  _savePaymentProduct(paymentProduct),
              onError: (errorResponse) => _saveErrorResponse(errorResponse),
              onException: (nativeException) =>
                  _saveNativeException(nativeException),
            );
      case IinStatus.existingButNotAllowed:
        final validationErrorMessages = state.validationErrorMessages;
        final errorMessage =
            strings.getValidationErrorMessage("allowedInContext");
        validationErrorMessages[constants.cardFieldId] = [errorMessage];
        state =
            state.copyWith(validationErrorMessages: validationErrorMessages);
      case IinStatus.unknown:
        final validationErrorMessages = state.validationErrorMessages;
        final errorMessage = strings.getValidationErrorMessage("iin");
        validationErrorMessages[constants.cardFieldId] = [errorMessage];
        state =
            state.copyWith(validationErrorMessages: validationErrorMessages);
      case IinStatus.notEnoughDigits:
        final errorResponse =
            _createErrorResponse(strings.iinNotEnoughDigitsLabel);
        _saveErrorResponse(errorResponse);
    }
  }

  void _savePaymentProduct(PaymentProduct paymentProduct) {
    // Only update the state if the retrieved payment product is different from the currently stored payment product
    if ((state.paymentProductResult.data as PaymentProduct).id !=
        paymentProduct.id) {
      _determineFieldsForInput(paymentProduct.fields);

      // Since this function is only triggered on IIN Details result, the field input does not need to be cleaned
      state = state.copyWith(
        paymentProductResult: Result(
          data: paymentProduct,
          errorResponse: null,
          nativeException: null,
        ),
      );
    }
  }

  void saveAccountOnFile(
    AccountOnFile? accountOnFile,
    PaymentProduct paymentProduct,
  ) {
    state = state.copyWith(
      accountOnFile: accountOnFile,
      paymentProductResult: Result(
        data: paymentProduct,
        errorResponse: null,
        nativeException: null,
      ),
      lastRequestedIin: null,
      fieldsInput: {},
      validationErrorMessages: {},
      liveValidationEnabled: false,
    );
  }

  void _saveErrorResponse(ErrorResponse? errorResponse) {
    state = state.copyWith(
      paymentProductResult: Result(
        data: null,
        errorResponse: errorResponse,
        nativeException: null,
      ),
    );
  }

  void _saveNativeException(NativeException? nativeException) {
    state = state.copyWith(
      paymentProductResult: Result(
        data: null,
        errorResponse: null,
        nativeException: nativeException,
      ),
    );
  }

  void _determineFieldsForInput(
    List<PaymentProductField> paymentProductFields,
  ) {
    if (!_containsField(paymentProductFields, constants.cardFieldId)) {
      _removeFieldInput(constants.cardFieldId);
    }
    if (!_containsField(paymentProductFields, constants.expiryDateFieldId)) {
      _removeFieldInput(constants.expiryDateFieldId);
    }
    if (!_containsField(paymentProductFields, constants.cvvFieldId)) {
      _removeFieldInput(constants.cvvFieldId);
    }
    if (!_containsField(paymentProductFields, constants.securityCodeFieldId)) {
      _removeFieldInput(constants.securityCodeFieldId);
    }
    if (!_containsField(paymentProductFields, constants.cardHolderFieldId)) {
      _removeFieldInput(constants.cardHolderFieldId);
    }
  }

  bool _containsField(
    List<PaymentProductField> paymentProductFields,
    String key,
  ) {
    return paymentProductFields.map((field) => field.id).contains(key);
  }

  void _removeFieldInput(String key) {
    final fieldsInput = state.fieldsInput;
    fieldsInput.remove(key);
    final validationErrorMessages = state.validationErrorMessages;
    validationErrorMessages.remove(key);
    state = state.copyWith(
      fieldsInput: fieldsInput,
      validationErrorMessages: validationErrorMessages,
    );
  }

  void updateFieldInput(String key, String value) {
    final fieldsInput = state.fieldsInput;
    fieldsInput[key] = value;
    state = state.copyWith(fieldsInput: fieldsInput);
  }

  void _removeValidationErrorMessages(String key) {
    final validationErrorMessages = state.validationErrorMessages;
    validationErrorMessages.remove(key);
    state = state.copyWith(validationErrorMessages: validationErrorMessages);
  }

  void _updateValidationErrorMessages(
    String key,
    List<String> messages,
  ) {
    final validationErrorMessages = state.validationErrorMessages;
    validationErrorMessages[key] = messages;
    state = state.copyWith(validationErrorMessages: validationErrorMessages);
  }

  void toggleRememberPaymentDetails(bool rememberPaymentDetails) {
    state = state.copyWith(rememberPaymentDetails: rememberPaymentDetails);
  }

  Future<void> validateAllFields({required VoidCallback onComplete}) async {
    final paymentProductFields =
        (state.paymentProductResult.data as PaymentProduct).fields;

    for (final field in paymentProductFields) {
      if (state.accountOnFile != null && field.id == constants.cardFieldId) {
        // If an Account on File exists and the field is card number, then the validation can be skipped because the card number cannot be modified
        continue;
      }

      final fieldValue = _getFieldValue(field.id) ?? "";

      await validateField(field, fieldValue);
    }

    // Enable live validation, so when fields are edited there is immediate feedback on whether the input is valid or not
    // All input fields are rebuild on this value change, to ensure all possible error messages are shown
    toggleLiveValidationEnabled(true);

    onComplete();
  }

  String? _getFieldValue(String fieldId) {
    // If value in fieldsInput does not exist, check for AccountOnFile attribute, if that also does not exist then return null
    final fieldsInputValue = state.fieldsInput[fieldId];

    if (fieldsInputValue != null) {
      return fieldsInputValue;
    } else {
      return state.accountOnFile?.attributes
          .firstWhereOrNull(
            (attribute) => attribute.key == fieldId,
          )
          ?.value;
    }
  }

  Future<void> validateField(
    PaymentProductField field,
    String value, {
    Function? onComplete,
  }) async {
    final validationErrorMessages = await field.validateValue(value);
    if (validationErrorMessages.isNotEmpty) {
      final errorMessages = validationErrorMessages.transformIntoStringsList();
      _updateValidationErrorMessages(field.id, errorMessages);
    } else {
      _removeValidationErrorMessages(field.id);
    }

    onComplete?.call();
  }

  void toggleLiveValidationEnabled(bool enableLiveValidation) {
    state = state.copyWith(liveValidationEnabled: enableLiveValidation);
  }
}
