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
import 'package:online_payments_repository/helpers/validation_error_message_helper.dart';
import 'package:online_payments_sdk/online_payments_sdk.dart';

/// Extension that transforms the keys of [ValidationErrorMessage]s into a list of error messages to be displayed on the UI.
extension ValidationErrorMessageToStringExtension
    on List<ValidationErrorMessage> {
  List<String> transformIntoStringsList() {
    List<String> stringErrorMessages = [];

    for (final validationErrorMessage in this) {
      final stringErrorMessage =
          ValidationErrorMessageHelper.getErrorMessage(validationErrorMessage);
      stringErrorMessages.add(stringErrorMessage);
    }

    return stringErrorMessages;
  }
}
