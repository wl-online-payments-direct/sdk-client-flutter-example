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
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_payments_flutter_example/reusable_components/default_padding.dart';
import 'package:online_payments_flutter_example/reusable_components/input_text_form_field.dart';
import 'package:online_payments_flutter_example/reusable_components/label_with_switch.dart';
import 'package:online_payments_flutter_example/reusable_components/loading_spinner.dart';
import 'package:online_payments_flutter_example/reusable_components/sized_box_button.dart';
import 'package:online_payments_flutter_example/reusable_components/vertical_scroll_view.dart';
import 'package:online_payments_repository/constants.dart' as constants;
import 'package:online_payments_repository/providers/card_input_state_provider.dart';
import 'package:online_payments_repository/providers/encrypted_payment_request_state_provider.dart';
import 'package:online_payments_repository/providers/loading_state_provider.dart';
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';

class CardProductPage extends ConsumerWidget {
  const CardProductPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const CardProductPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PaymentProduct? paymentProduct = ref.watch(
      cardInputStateProvider.select((value) => value.paymentProductResult.data),
    );
    final accountOnFile = ref.read(cardInputStateProvider).accountOnFile;
    final formKey = GlobalKey<FormState>();

    return VerticalScrollView(
      childWidget: DefaultPadding.horizontal(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              if (paymentProduct != null) ...[
                _CardInputFields(
                  paymentProductFields: paymentProduct.fields,
                  logoUrl: paymentProduct.displayHintsList[0].logoUrl,
                  accountOnFile: accountOnFile,
                ),
                const DefaultPadding(),
                if (paymentProduct.allowsTokenization &&
                    paymentProduct.accountsOnFile.isEmpty) ...[
                  const _RememberPaymentDetailsSwitch(),
                  const DefaultPadding(),
                ],
                _PayButton(
                  onButtonPressed: () {
                    ref.read(cardInputStateProvider.notifier).validateAllFields(
                      onComplete: () {
                        final validationErrorMessages = ref
                            .read(cardInputStateProvider)
                            .validationErrorMessages;
                        if (validationErrorMessages.entries.isEmpty) {
                          final fieldsInput =
                              ref.read(cardInputStateProvider).fieldsInput;
                          final rememberPaymentDetails = ref
                              .read(cardInputStateProvider)
                              .rememberPaymentDetails;
                          final paymentRequest = _createPaymentRequest(
                            paymentProduct,
                            accountOnFile,
                            fieldsInput,
                            rememberPaymentDetails,
                          );
                          ref
                              .read(
                                  encryptedPaymentRequestStateProvider.notifier)
                              .encryptPaymentRequest(paymentRequest);
                        } else {
                          ref
                              .read(loadingStateProvider.notifier)
                              .updateEncryptPaymentLoadingStatus(false);
                        }
                      },
                    );
                  },
                ),
              ] else
                const Text(strings.errorRetrievingProductLabel),
            ],
          ),
        ),
      ),
    );
  }

  PaymentRequest _createPaymentRequest(
    PaymentProduct paymentProduct,
    AccountOnFile? accountOnFile,
    Map<String, String> fieldsInput,
    bool rememberPaymentDetails,
  ) {
    final paymentRequest = PaymentRequest(
      paymentProduct: paymentProduct,
      tokenize: rememberPaymentDetails,
      accountOnFile: accountOnFile,
    );

    fieldsInput.forEach((key, value) {
      paymentRequest.setValue(key, value);
    });

    return paymentRequest;
  }
}

class _CardInputFields extends ConsumerWidget {
  final List<PaymentProductField> paymentProductFields;
  final String? logoUrl;
  final AccountOnFile? accountOnFile;

  const _CardInputFields({
    required this.paymentProductFields,
    this.logoUrl,
    this.accountOnFile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardField = paymentProductFields
        .firstWhereOrNull((field) => field.id == constants.cardFieldId);
    final expiryDateField = paymentProductFields
        .firstWhereOrNull((field) => field.id == constants.expiryDateFieldId);
    final cvvField = paymentProductFields
        .firstWhereOrNull((field) => field.id == constants.cvvFieldId);
    final securityCodeField = paymentProductFields
        .firstWhereOrNull((field) => field.id == constants.securityCodeFieldId);
    final cardholderField = paymentProductFields
        .firstWhereOrNull((field) => field.id == constants.cardHolderFieldId);
    // To ensure the widget (and its children) are rebuild and possible error messages are shown once the 'Pay' button has been pressed
    ref.watch(
      cardInputStateProvider.select((value) => value.liveValidationEnabled),
    );

    return Column(
      children: [
        if (cardField != null) ...[
          const DefaultPadding(),
          _CardNumberField(
            field: cardField,
            logoUrl: logoUrl,
            accountOnFile: accountOnFile,
          )
        ],
        if (expiryDateField != null && cvvField != null) ...[
          const DefaultPadding(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ExpiryDateField(
                  field: expiryDateField,
                  accountOnFile: accountOnFile,
                ),
              ),
              DefaultPadding.horizontal(size: 10),
              Expanded(
                child: _CvvField(field: cvvField),
              )
            ],
          )
        ] else ...[
          if (expiryDateField != null) ...[
            const DefaultPadding(),
            _ExpiryDateField(
              field: expiryDateField,
              accountOnFile: accountOnFile,
            ),
          ],
          if (cvvField != null) ...[
            const DefaultPadding(),
            // CVV field does not require an AccountOnFile, since this value should always be entered by the customer
            _CvvField(field: cvvField),
          ]
        ],
        if (securityCodeField != null) ...[
          const DefaultPadding(),
          _SecurityCodeField(
            field: securityCodeField,
            accountOnFile: accountOnFile,
          ),
        ],
        if (cardholderField != null) ...[
          const DefaultPadding(),
          _CardholderField(
            field: cardholderField,
            accountOnFile: accountOnFile,
          )
        ]
      ],
    );
  }
}

class _CardNumberField extends ConsumerStatefulWidget {
  final PaymentProductField field;
  final String? logoUrl;
  final AccountOnFile? accountOnFile;

  const _CardNumberField({
    required this.field,
    this.logoUrl,
    this.accountOnFile,
  });

  @override
  ConsumerState<_CardNumberField> createState() => _CardNumberFieldState();
}

class _CardNumberFieldState extends ConsumerState<_CardNumberField> {
  String? maskedValue;

  @override
  Widget build(BuildContext context) {
    final cardNumberAccountOnFileValue = widget.accountOnFile?.attributes
        .firstWhereOrNull(
          (attribute) => attribute.key == constants.cardFieldId,
        )
        ?.value;
    final cardNumberFieldValue = ref.watch(cardInputStateProvider
        .select((value) => value.fieldsInput[constants.cardFieldId]));
    final cardNumber =
        (cardNumberFieldValue ?? cardNumberAccountOnFileValue) ?? "";
    final cardNumberValidationErrorMessages = ref.read(
      cardInputStateProvider.select(
        (value) => value.validationErrorMessages[constants.cardFieldId],
      ),
    );
    final cardInputStateProviderNotifier =
        ref.read(cardInputStateProvider.notifier);

    return _FocusTextField(
      childWidget: InputTextFormField(
        label: widget.field.displayHints?.label,
        hint: strings.cardPlaceholderLabel,
        errorText: cardNumberValidationErrorMessages?[0],
        value: maskedValue ?? cardNumber,
        prefixIcon: const Icon(Icons.credit_card),
        suffixImageUrl: widget.logoUrl,
        keyboardType: TextInputType.number,
        textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
        // This field should never be enabled when using an account on file, since the card number cannot be adjusted
        enabled: widget.accountOnFile == null,
        onInputChanged: (partialCreditCardNumber) {
          // If liveValidationEnabled first validate the value, then assign the value to fieldsInput to ensure the validation messages are set on rebuilt of widget
          // Else update the value of fieldsInput immediately
          if (ref.read(cardInputStateProvider).liveValidationEnabled) {
            cardInputStateProviderNotifier.validateField(
              widget.field,
              partialCreditCardNumber,
              onComplete: () {
                cardInputStateProviderNotifier.updateFieldInput(
                  constants.cardFieldId,
                  partialCreditCardNumber,
                );
                if (partialCreditCardNumber.length >= 6) {
                  cardInputStateProviderNotifier
                      .getIinDetails(partialCreditCardNumber);
                }
              },
            );
          } else {
            cardInputStateProviderNotifier.updateFieldInput(
              constants.cardFieldId,
              partialCreditCardNumber,
            );
            if (partialCreditCardNumber.length >= 6) {
              cardInputStateProviderNotifier
                  .getIinDetails(partialCreditCardNumber);
            }
          }
        },
      ),
      onFocus: () => maskedValue = null,
      onFocusLost: () async {
        final appliedMask = await widget.field.applyMask(cardNumber);
        setState(() {
          maskedValue = appliedMask;
        });
      },
    );
  }
}

class _ExpiryDateField extends ConsumerStatefulWidget {
  final PaymentProductField field;
  final AccountOnFile? accountOnFile;

  const _ExpiryDateField({required this.field, this.accountOnFile});

  @override
  ConsumerState<_ExpiryDateField> createState() => _ExpiryDateFieldState();
}

class _ExpiryDateFieldState extends ConsumerState<_ExpiryDateField> {
  String? maskedValue;

  @override
  Widget build(BuildContext context) {
    final expiryDateAttribute =
        widget.accountOnFile?.attributes.firstWhereOrNull(
      (attribute) => attribute.key == constants.expiryDateFieldId,
    );
    final expiryDateFieldValue = ref.watch(
      cardInputStateProvider.select(
        (value) => value.fieldsInput[constants.expiryDateFieldId],
      ),
    );
    final expiryDate =
        (expiryDateFieldValue ?? expiryDateAttribute?.value) ?? "";
    final expiryDateValidationErrorMessages = ref.read(
      cardInputStateProvider.select(
        (value) => value.validationErrorMessages[constants.expiryDateFieldId],
      ),
    );
    final cardInputStateProviderNotifier =
        ref.read(cardInputStateProvider.notifier);

    final mask = widget.field.displayHints?.mask ?? "{{99}}/{{99}}";
    final maxDigits = mask.split("9").length;
    final useFullYear = maxDigits == 6;

    return _FocusTextField(
      childWidget: InputTextFormField(
        label: widget.field.displayHints?.label,
        hint: useFullYear ? strings.expiryDatePlaceholderLabel: strings.expiryDateFullYearPlaceholderLabel,
        errorText: expiryDateValidationErrorMessages?[0],
        value: maskedValue ?? expiryDate,
        prefixIcon: const Icon(Icons.calendar_month_sharp),
        keyboardType: TextInputType.number,
        textInputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(maxDigits)
        ],
        enabled: expiryDateAttribute?.isEditingAllowed() ?? true,
        onInputChanged: (value) {
          // If liveValidationEnabled first validate the value, then assign the value to fieldsInput to ensure the validation messages are set on rebuilt of widget
          // Else update the value of fieldsInput immediately
          if (ref.read(cardInputStateProvider).liveValidationEnabled) {
            cardInputStateProviderNotifier.validateField(
              widget.field,
              value,
              onComplete: () {
                cardInputStateProviderNotifier.updateFieldInput(
                  constants.expiryDateFieldId,
                  value,
                );
              },
            );
          } else {
            cardInputStateProviderNotifier.updateFieldInput(
              constants.expiryDateFieldId,
              value,
            );
          }
        },
      ),
      onFocus: () => maskedValue = null,
      onFocusLost: () async {
        final appliedMask = await widget.field.applyMask(expiryDate);
        setState(() {
          maskedValue = appliedMask;
        });
      },
    );
  }
}

class _CvvField extends ConsumerStatefulWidget {
  final PaymentProductField field;

  const _CvvField({required this.field});

  @override
  ConsumerState<_CvvField> createState() => _CvvFieldState();
}

class _CvvFieldState extends ConsumerState<_CvvField> {
  String? maskedValue;

  @override
  Widget build(BuildContext context) {
    final cvv = ref.watch(cardInputStateProvider
            .select((value) => value.fieldsInput[constants.cvvFieldId])) ??
        "";
    final cvvValidationErrorMessages = ref.read(
      cardInputStateProvider.select(
        (value) => value.validationErrorMessages[constants.cvvFieldId],
      ),
    );
    final cardInputStateProviderNotifier =
        ref.read(cardInputStateProvider.notifier);

    return _FocusTextField(
      childWidget: InputTextFormField(
        label: widget.field.displayHints?.label,
        hint: strings.cvvPlaceholderLabel,
        tooltipText: widget.field.displayHints?.tooltip?.label,
        errorText: cvvValidationErrorMessages?[0],
        value: maskedValue ?? cvv,
        prefixIcon: const Icon(Icons.lock),
        keyboardType: TextInputType.number,
        textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onInputChanged: (value) {
          // If liveValidationEnabled first validate the value, then assign the value to fieldsInput to ensure the validation messages are set on rebuilt of widget
          // Else update the value of fieldsInput immediately
          if (ref.read(cardInputStateProvider).liveValidationEnabled) {
            cardInputStateProviderNotifier.validateField(
              widget.field,
              value,
              onComplete: () {
                cardInputStateProviderNotifier.updateFieldInput(
                  constants.cvvFieldId,
                  value,
                );
              },
            );
          } else {
            cardInputStateProviderNotifier.updateFieldInput(
              constants.cvvFieldId,
              value,
            );
          }
        },
      ),
      onFocus: () => maskedValue = null,
      onFocusLost: () async {
        final appliedMask = await widget.field.applyMask(cvv);
        setState(() {
          maskedValue = appliedMask;
        });
      },
    );
  }
}

class _SecurityCodeField extends ConsumerStatefulWidget {
  final PaymentProductField field;
  final AccountOnFile? accountOnFile;

  const _SecurityCodeField({required this.field, this.accountOnFile});

  @override
  ConsumerState<_SecurityCodeField> createState() => _SecurityCodeFieldState();
}

class _SecurityCodeFieldState extends ConsumerState<_SecurityCodeField> {
  String? maskedValue;

  @override
  Widget build(BuildContext context) {
    final securityCodeAttribute =
        widget.accountOnFile?.attributes.firstWhereOrNull(
      (attribute) => attribute.key == constants.securityCodeFieldId,
    );
    final securityCodeFieldValue = ref.watch(
      cardInputStateProvider.select(
        (value) => value.fieldsInput[constants.securityCodeFieldId],
      ),
    );
    final securityCode =
        (securityCodeFieldValue ?? securityCodeAttribute?.value) ?? "";
    final securityCodeValidationErrorMessages = ref.read(
      cardInputStateProvider.select(
        (value) => value.validationErrorMessages[constants.securityCodeFieldId],
      ),
    );
    final cardInputStateProviderNotifier =
        ref.read(cardInputStateProvider.notifier);

    return _FocusTextField(
      childWidget: InputTextFormField(
        label: widget.field.displayHints?.label,
        hint: strings.securityCodePlaceholderLabel,
        errorText: securityCodeValidationErrorMessages?[0],
        value: maskedValue ?? securityCode,
        prefixIcon: const Icon(Icons.lock),
        keyboardType: TextInputType.number,
        textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enabled: securityCodeAttribute?.isEditingAllowed() ?? true,
        onInputChanged: (value) {
          // If liveValidationEnabled first validate the value, then assign the value to fieldsInput to ensure the validation messages are set on rebuilt of widget
          // Else update the value of fieldsInput immediately
          if (ref.read(cardInputStateProvider).liveValidationEnabled) {
            cardInputStateProviderNotifier.validateField(
              widget.field,
              value,
              onComplete: () {
                cardInputStateProviderNotifier.updateFieldInput(
                  constants.securityCodeFieldId,
                  value,
                );
              },
            );
          } else {
            cardInputStateProviderNotifier.updateFieldInput(
              constants.securityCodeFieldId,
              value,
            );
          }
        },
      ),
      onFocus: () => maskedValue = null,
      onFocusLost: () async {
        final appliedMask = await widget.field.applyMask(securityCode);
        setState(() {
          maskedValue = appliedMask;
        });
      },
    );
  }
}

class _CardholderField extends ConsumerStatefulWidget {
  final PaymentProductField field;
  final AccountOnFile? accountOnFile;

  const _CardholderField({required this.field, this.accountOnFile});

  @override
  ConsumerState<_CardholderField> createState() => _CardholderFieldState();
}

class _CardholderFieldState extends ConsumerState<_CardholderField> {
  String? maskedValue;

  @override
  Widget build(BuildContext context) {
    final cardHolderAttribute =
        widget.accountOnFile?.attributes.firstWhereOrNull(
      (attribute) => attribute.key == constants.cardHolderFieldId,
    );
    final cardHolderFieldValue = ref.watch(
      cardInputStateProvider.select(
        (value) => value.fieldsInput[constants.cardHolderFieldId],
      ),
    );
    final cardHolder =
        (cardHolderFieldValue ?? cardHolderAttribute?.value) ?? "";
    final cardHolderValidationErrorMessages = ref.read(
      cardInputStateProvider.select(
        (value) => value.validationErrorMessages[constants.cardHolderFieldId],
      ),
    );
    final cardInputStateProviderNotifier =
        ref.read(cardInputStateProvider.notifier);

    return _FocusTextField(
      childWidget: InputTextFormField(
        label: widget.field.displayHints?.label,
        hint: strings.cardHolderPlaceholderLabel,
        errorText: cardHolderValidationErrorMessages?[0],
        value: maskedValue ?? cardHolder,
        prefixIcon: const Icon(Icons.person),
        enabled: cardHolderAttribute?.isEditingAllowed() ?? true,
        onInputChanged: (value) {
          // If liveValidationEnabled first validate the value, then assign the value to fieldsInput to ensure the validation messages are set on rebuilt of widget
          // Else update the value of fieldsInput immediately
          if (ref.read(cardInputStateProvider).liveValidationEnabled) {
            cardInputStateProviderNotifier.validateField(
              widget.field,
              value,
              onComplete: () {
                cardInputStateProviderNotifier.updateFieldInput(
                  constants.cardHolderFieldId,
                  value,
                );
              },
            );
          } else {
            cardInputStateProviderNotifier.updateFieldInput(
              constants.cardHolderFieldId,
              value,
            );
          }
        },
      ),
      onFocus: () => maskedValue = null,
      onFocusLost: () async {
        final appliedMask = await widget.field.applyMask(cardHolder);
        setState(() {
          maskedValue = appliedMask;
        });
      },
    );
  }
}

class _RememberPaymentDetailsSwitch extends ConsumerWidget {
  const _RememberPaymentDetailsSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LabelWithSwitch(
      label: strings.rememberPaymentDetailsLabel,
      labelIsMultiLine: true,
      fontSize: 14,
      isEnabled: ref.watch(cardInputStateProvider
          .select((value) => value.rememberPaymentDetails)),
      onValueChanged: (value) => ref
          .read(cardInputStateProvider.notifier)
          .toggleRememberPaymentDetails(value),
    );
  }
}

class _FocusTextField extends StatelessWidget {
  final Widget childWidget;
  final VoidCallback onFocus;
  final Future<void> Function() onFocusLost;

  const _FocusTextField({
    required this.childWidget,
    required this.onFocus,
    required this.onFocusLost,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: childWidget,
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          onFocus();
        } else {
          onFocusLost();
        }
      },
    );
  }
}

class _PayButton extends ConsumerWidget {
  final VoidCallback onButtonPressed;

  const _PayButton({required this.onButtonPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      loadingStateProvider.select(
        ((value) => value.isLoadingEncryptPayment),
      ),
    );

    if (isLoading) {
      return const LoadingSpinner();
    } else {
      return SizedBoxButton(
        buttonText: strings.payButtonLabel,
        onButtonPressed: () {
          // Set loading state so that button cannot be double pressed
          ref
              .read(loadingStateProvider.notifier)
              .updateEncryptPaymentLoadingStatus(true);
          onButtonPressed();
        },
      );
    }
  }
}
