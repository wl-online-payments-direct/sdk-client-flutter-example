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
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';

part 'payment_details.freezed.dart';

@freezed
class PaymentDetails with _$PaymentDetails {
  factory PaymentDetails({
    required PaymentContext paymentContext,
    @Default(false) bool applePayEnabled,
    @Default(false) bool googlePayEnabled,
    String? merchantId,
    String? merchantName,
  }) = _PaymentDetails;
}
