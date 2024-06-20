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
import 'package:online_payments_repository/models/payment_details.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_details_state_provider.g.dart';

/// Since this provider is used on the initial screen, it does not require the keepAlive identifier, since it will be alive anyway.
/// This provider is never invalidated, so it remembers the input for a next payment.
@Riverpod()
class PaymentDetailsState extends _$PaymentDetailsState {
  @override
  PaymentDetails build() {
    return PaymentDetails(
      paymentContext: PaymentContext(AmountOfMoney(0, ""), "", false),
    );
  }

  void updateAmountInCents(int amountInCents) {
    state = state.copyWith(
      paymentContext: state.paymentContext.copyWith(
        amountOfMoney: AmountOfMoney(
          amountInCents,
          state.paymentContext.amountOfMoney.currencyCode,
        ),
      ),
    );
  }

  void updateCurrencyCode(String currencyCode) {
    state = state.copyWith(
      paymentContext: state.paymentContext.copyWith(
        amountOfMoney: AmountOfMoney(
          state.paymentContext.amountOfMoney.amount,
          currencyCode,
        ),
      ),
    );
  }

  void updateCountryCode(String countryCode) {
    state = state.copyWith(
      paymentContext: state.paymentContext.copyWith(
        countryCode: countryCode,
      ),
    );
  }

  void isRecurring(bool isRecurring) {
    state = state.copyWith(
      paymentContext: state.paymentContext.copyWith(
        isRecurring: isRecurring,
      ),
    );
  }

  void enableApplePay(bool enableApplePay) {
    if (enableApplePay) {
      state = state.copyWith(applePayEnabled: enableApplePay);
    } else {
      // If ApplePay is disabled, also remove the filled in value for merchantId
      state = state.copyWith(applePayEnabled: enableApplePay, merchantId: null);
    }
  }

  void enableGooglePay(bool enableGooglePay) {
    if (enableGooglePay) {
      state = state.copyWith(googlePayEnabled: enableGooglePay);
    } else {
      // If GooglePay is disabled, also remove the filled in value for merchantId and merchantName
      state = state.copyWith(
        googlePayEnabled: enableGooglePay,
        merchantId: null,
        merchantName: null,
      );
    }
  }

  void updateMerchantId(String merchantId) {
    state = state.copyWith(merchantId: merchantId);
  }

  void updateMerchantName(String merchantName) {
    state = state.copyWith(merchantName: merchantName);
  }
}
