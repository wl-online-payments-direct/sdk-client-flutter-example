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
import 'package:online_payments_repository/models/result.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';

part 'card_input.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CardInput with _$CardInput {
  factory CardInput({
    required Result<PaymentProduct> paymentProductResult,
    AccountOnFile? accountOnFile,
    required Map<String, String> fieldsInput,
    required Map<String, List<String>?> validationErrorMessages,
    @Default(false) bool liveValidationEnabled,
    @Default(false) bool rememberPaymentDetails,
    String? lastRequestedIin,
  }) = _CardInput;
}
