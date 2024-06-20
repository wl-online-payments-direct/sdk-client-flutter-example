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
import 'package:online_payments_repository/providers/payment_details_state_provider.dart';
import 'package:online_payments_repository/providers/session_state_provider.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_products_state_provider.g.dart';

/// Since this provider is used on the initial screen, it does not require the keepAlive identifier, since it will be alive anyway.
/// This provider is invalidated when a payment was created successfully, since then all its data should be cleared.
@Riverpod()
class PaymentProductsState extends _$PaymentProductsState {
  @override
  Result<BasicPaymentProducts> build() {
    return Result();
  }

  void getBasicPaymentProducts() {
    final session = ref.read(sessionStateProvider);
    final paymentContext = ref.read(paymentDetailsStateProvider).paymentContext;

    final request = BasicPaymentProductsRequest(paymentContext: paymentContext);

    final listener = BasicPaymentProductsResponseListener(
      onSuccess: _saveBasicPaymentProducts,
      onError: _saveErrorResponse,
      onException: _saveNativeException,
    );

    session?.getBasicPaymentProducts(request: request, listener: listener);
  }

  void _saveBasicPaymentProducts(BasicPaymentProducts basicPaymentProducts) {
    state = state.copyWith(
      data: basicPaymentProducts,
      errorResponse: null,
      nativeException: null,
    ) as Result<BasicPaymentProducts>;
  }

  void _saveErrorResponse(ErrorResponse? errorResponse) {
    state = state.copyWith(
      data: null,
      errorResponse: errorResponse,
      nativeException: null,
    ) as Result<BasicPaymentProducts>;
  }

  void _saveNativeException(NativeException? nativeException) {
    state = state.copyWith(
      data: null,
      errorResponse: null,
      nativeException: nativeException,
    ) as Result<BasicPaymentProducts>;
  }
}
