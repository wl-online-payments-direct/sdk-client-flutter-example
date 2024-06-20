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
import 'package:online_payments_repository/models/result.dart';
import 'package:online_payments_repository/providers/session_state_provider.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'encrypted_payment_request_state_provider.g.dart';

/// This provider is invalidated automatically once you return to start after creating a payment and when navigating back from the Payment Products Overview.
@Riverpod()
class EncryptedPaymentRequestState extends _$EncryptedPaymentRequestState {
  @override
  Result<PreparedPaymentRequest> build() {
    return Result();
  }

  void encryptPaymentRequest(PaymentRequest paymentRequest) {
    final session = ref.read(sessionStateProvider);

    final request = SdkPreparePaymentRequest(paymentRequest);

    final listener = PaymentRequestPreparedListener(
      onSuccess: _saveEncryptedPaymentRequest,
      onError: _saveErrorResponse,
      onException: _saveNativeException,
    );

    session?.preparePaymentRequest(request: request, listener: listener);
  }

  void _saveEncryptedPaymentRequest(
      PreparedPaymentRequest preparedPaymentRequest) {
    state = state.copyWith(
      data: preparedPaymentRequest,
      errorResponse: null,
      nativeException: null,
    ) as Result<PreparedPaymentRequest>;
  }

  void _saveErrorResponse(ErrorResponse? errorResponse) {
    state = state.copyWith(
      data: null,
      errorResponse: errorResponse,
      nativeException: null,
    ) as Result<PreparedPaymentRequest>;
  }

  void _saveNativeException(NativeException? nativeException) {
    state = state.copyWith(
      data: null,
      errorResponse: null,
      nativeException: nativeException,
    ) as Result<PreparedPaymentRequest>;
  }
}
