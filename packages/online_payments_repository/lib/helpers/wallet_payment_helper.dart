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
import 'dart:convert';
import 'dart:developer';

import 'package:online_payments_repository/constants.dart' as constants;
import 'package:online_payments_repository/models/payment_details.dart';
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';
import 'package:pay/pay.dart';

class WalletPaymentHelper {
  static void startWalletPayment(
    PaymentProduct paymentProduct,
    PaymentDetails paymentDetails,
    Function(PaymentRequest) onWalletPaymentSuccess,
  ) {
    // PaymentContext.amount is in cents, but the PaymentItem expects it to be of a basic monetary unit (eg. euros instead of cents)
    final amountInEuros =
        (paymentDetails.paymentContext.amountOfMoney.amount / 100).toString();
    final paymentItems = [
      PaymentItem(
        label: constants.totalLabel,
        amount: amountInEuros,
        status: PaymentItemStatus.final_price,
      )
    ];

    if (paymentProduct.id == constants.paymentProductIdApplePay) {
      _startApplePayPayment(
        paymentProduct,
        paymentDetails,
        paymentItems,
        onWalletPaymentSuccess,
      );
    } else {
      _startGooglePayPayment(
        paymentProduct,
        paymentDetails,
        paymentItems,
        onWalletPaymentSuccess,
      );
    }
  }

  static String _createApplePayPaymentConfiguration(
    PaymentProduct applePay,
    PaymentDetails paymentDetails,
  ) {
    final supportedNetworks = applePay.paymentProduct302SpecificData?.networks
        .map((network) => network.toLowerCase())
        .toList();

    Map additionalPaymentConfiguration = {
      "provider": constants.applePayProvider,
      "data": {
        "merchantIdentifier": paymentDetails.merchantId ?? "",
        "merchantCapabilities": constants.merchantCapabilities,
        "supportedNetworks": supportedNetworks,
        "countryCode": paymentDetails.paymentContext.countryCode,
        "currencyCode":
            paymentDetails.paymentContext.amountOfMoney.currencyCode,
      }
    };

    return jsonEncode(additionalPaymentConfiguration);
  }

  static void _startApplePayPayment(
    PaymentProduct paymentProduct,
    PaymentDetails paymentDetails,
    List<PaymentItem> paymentItems,
    Function(PaymentRequest) onApplePaySuccess,
  ) async {
    final paymentConfigurationString =
        _createApplePayPaymentConfiguration(paymentProduct, paymentDetails);
    final paymentConfiguration =
        PaymentConfiguration.fromJsonString(paymentConfigurationString);

    final payClient = Pay({PayProvider.apple_pay: paymentConfiguration});

    try {
      final result = await payClient.showPaymentSelector(
          PayProvider.apple_pay, paymentItems);
      final token = result["token"];
      final encryptedPaymentData =
          token is String ? token : token?["paymentData"]?.toString() ?? "";
      final transactionId = result["transactionIdentifier"]?.toString() ?? "";

      final paymentRequest = PaymentRequest(paymentProduct: paymentProduct);
      paymentRequest.setValue(
        constants.encryptedPaymentDataKey,
        encryptedPaymentData,
      );
      paymentRequest.setValue(constants.transactionIdKey, transactionId);
      onApplePaySuccess(paymentRequest);
    } catch (exception) {
      log(strings.errorLoggingWalletPayment + exception.toString());
    }
  }

  static String _createGooglePayPaymentConfiguration(
    PaymentProduct googlePay,
    PaymentDetails paymentDetails,
  ) {
    Map additionalPaymentConfiguration = {
      "provider": constants.googlePayProvider,
      "data": {
        "environment":
            constants.environmentIsProduction ? "PRODUCTION" : "TEST",
        "apiVersion": constants.googlePayApiVersion,
        "apiVersionMinor": constants.minorGooglePayApiVersion,
        "allowedPaymentMethods": [
          {
            "type": constants.paymentMethodType,
            "tokenizationSpecification": {
              "type": constants.tokenizationSpecificationType,
              "parameters": {
                "gateway": googlePay.paymentProduct320SpecificData?.gateway,
                "gatewayMerchantId": paymentDetails.merchantId
              }
            },
            "parameters": {
              "allowedCardNetworks":
                  googlePay.paymentProduct320SpecificData?.networks,
              "allowedAuthMethods": constants.allowedAuthMethods,
            }
          }
        ],
        "merchantInfo": {
          "merchantId": paymentDetails.merchantId,
          "merchantName": paymentDetails.merchantName
        },
        "transactionInfo": {
          "countryCode": paymentDetails.paymentContext.countryCode,
          "currencyCode":
              paymentDetails.paymentContext.amountOfMoney.currencyCode
        }
      }
    };

    return jsonEncode(additionalPaymentConfiguration);
  }

  static void _startGooglePayPayment(
    PaymentProduct paymentProduct,
    PaymentDetails paymentDetails,
    List<PaymentItem> paymentItems,
    Function(PaymentRequest) onGooglePaySuccess,
  ) async {
    final paymentConfigurationString =
        _createGooglePayPaymentConfiguration(paymentProduct, paymentDetails);
    final paymentConfiguration =
        PaymentConfiguration.fromJsonString(paymentConfigurationString);

    // PaymentContext.amount is in cents, but the PaymentItem expects it to be of a basic monetary unit (eg. euros instead of cents)
    final amountInEuros =
        (paymentDetails.paymentContext.amountOfMoney.amount / 100).toString();
    final paymentItems = [
      PaymentItem(
        label: constants.totalLabel,
        amount: amountInEuros,
        status: PaymentItemStatus.final_price,
      )
    ];

    final payClient = Pay({PayProvider.google_pay: paymentConfiguration});

    try {
      final result = await payClient.showPaymentSelector(
          PayProvider.google_pay, paymentItems);
      final encryptedPaymentData = result["paymentMethodData"]
                  ?["tokenizationData"]?["token"]
              ?.toString() ??
          "";

      final paymentRequest = PaymentRequest(paymentProduct: paymentProduct);
      paymentRequest.setValue(
        constants.encryptedPaymentDataKey,
        encryptedPaymentData,
      );
      onGooglePaySuccess(paymentRequest);
    } catch (exception) {
      log(strings.errorLoggingWalletPayment + exception.toString());
    }
  }
}
