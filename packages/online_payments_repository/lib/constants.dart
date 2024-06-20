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
const String appIdentifier =
    "Online Payments Flutter Example Application/v1.0.0";
const bool environmentIsProduction = false;
const String cardPaymentMethod = "card";
const String encryptedPaymentDataKey = "encryptedPaymentData";
const String transactionIdKey = "transactionId";

/// Google Pay *
const String paymentProductIdGooglePay = "320";
const String googlePayProvider = "google_pay";
const int googlePayApiVersion = 2;
const int minorGooglePayApiVersion = 0;
const String paymentMethodType = "CARD";
const String tokenizationSpecificationType = "PAYMENT_GATEWAY";
const List allowedAuthMethods = ["PAN_ONLY", "CRYPTOGRAM_3DS"];
const String totalLabel = "Total";

/// Apple Pay *
const String paymentProductIdApplePay = "302";
const String applePayProvider = "apple_pay";
const List merchantCapabilities = ["3DS", "debit", "credit"];

/// Constants used to identify Card product fields *
const List<String> fieldValueKeys = [
  cardFieldId,
  expiryDateFieldId,
  cvvFieldId,
  securityCodeFieldId,
  cardHolderFieldId
];
const String cardFieldId = "cardNumber";
const String expiryDateFieldId = "expiryDate";
const String cvvFieldId = "cvv";
const String securityCodeFieldId = "PinCode";
const String cardHolderFieldId = "cardholderName";
