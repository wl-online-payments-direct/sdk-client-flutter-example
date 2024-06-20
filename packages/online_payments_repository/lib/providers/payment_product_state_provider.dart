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
import 'package:online_payments_repository/models/payment_product_wrapper.dart';
import 'package:online_payments_repository/models/result.dart';
import 'package:online_payments_repository/providers/card_input_state_provider.dart';
import 'package:online_payments_repository/providers/payment_details_state_provider.dart';
import 'package:online_payments_repository/providers/session_state_provider.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_product_state_provider.g.dart';

/// This provider is invalidated automatically once you navigate back from the Payment Products Overview or when you return to start after creating a payment.
@Riverpod()
class PaymentProductState extends _$PaymentProductState {
  @override
  PaymentProductWrapper build() {
    return PaymentProductWrapper(paymentProductResult: Result());
  }

  void getPaymentProduct(
    String productId,
    AccountOnFile? accountOnFile, {
    Function(PaymentProduct)? onSuccess,
    Function(ErrorResponse?)? onError,
    Function(NativeException?)? onException,
  }) {
    final session = ref.read(sessionStateProvider);
    final paymentContext = ref.read(paymentDetailsStateProvider).paymentContext;

    final request = PaymentProductRequest(
      paymentContext: paymentContext,
      productId: productId,
    );

    final listener = PaymentProductResponseListener(
      onSuccess: onSuccess ?? _savePaymentProduct,
      onError: onError ?? _saveErrorResponse,
      onException: onException ?? _saveNativeException,
    );

    session?.getPaymentProduct(request: request, listener: listener);

    if (state.accountOnFile?.id != accountOnFile?.id) {
      state = state.copyWith(accountOnFile: accountOnFile);
    }
  }

  void _savePaymentProduct(PaymentProduct paymentProduct) {
    state = state.copyWith(
      paymentProductResult: Result<PaymentProduct>(
        data: paymentProduct,
        errorResponse: null,
        nativeException: null,
      ),
    );

    ref
        .read(cardInputStateProvider.notifier)
        .saveAccountOnFile(state.accountOnFile, paymentProduct);
  }

  void _saveErrorResponse(ErrorResponse? errorResponse) {
    state = state.copyWith(
      paymentProductResult: Result<PaymentProduct>(
        data: null,
        errorResponse: errorResponse,
        nativeException: null,
      ),
    );
  }

  void _saveNativeException(NativeException? nativeException) {
    state = state.copyWith(
      paymentProductResult: Result<PaymentProduct>(
        data: null,
        errorResponse: null,
        nativeException: nativeException,
      ),
    );
  }
}
