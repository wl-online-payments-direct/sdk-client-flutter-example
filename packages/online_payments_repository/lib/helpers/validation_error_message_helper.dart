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
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';

class ValidationErrorMessageHelper {
  static String getErrorMessage(ValidationErrorMessage validationErrorMessage) {
    if (validationErrorMessage.rule is ValidationRuleLength) {
      return _validationErrorLength(
              validationErrorMessage.rule as ValidationRuleLength) ??
          strings.defaultError;
    } else if (validationErrorMessage.rule is ValidationRuleRange) {
      return _validationErrorRange(
          validationErrorMessage.rule as ValidationRuleRange);
    } else {
      return strings
          .getValidationErrorMessage(validationErrorMessage.errorMessage);
    }
  }

  static String? _validationErrorLength(
    ValidationRuleLength validationRuleLength,
  ) {
    if (validationRuleLength.minLength == validationRuleLength.maxLength) {
      final errorMessage = strings.getValidationErrorMessage("length.exact");
      return errorMessage.replaceAll(
        "{maxLength}",
        validationRuleLength.maxLength.toString(),
      );
    } else if (validationRuleLength.minLength == 0 &&
        validationRuleLength.maxLength > 0) {
      final errorMessage = strings.getValidationErrorMessage("length.max");
      return errorMessage.replaceAll(
        "{maxLength}",
        validationRuleLength.maxLength.toString(),
      );
    } else if (validationRuleLength.minLength > 0 &&
        validationRuleLength.maxLength > 0) {
      String errorMessage = strings.getValidationErrorMessage("length.between");
      errorMessage = errorMessage.replaceAll(
        "{minLength}",
        validationRuleLength.minLength.toString(),
      );
      return errorMessage.replaceAll(
        "{maxLength}",
        validationRuleLength.maxLength.toString(),
      );
    } else {
      return null;
    }
  }

  static String _validationErrorRange(ValidationRuleRange validationRuleRange) {
    String errorMessage = strings.getValidationErrorMessage("range");
    errorMessage = errorMessage.replaceAll(
      "{minValue}",
      validationRuleRange.minValue.toString(),
    );
    return errorMessage.replaceAll(
      "{maxValue}",
      validationRuleRange.maxValue.toString(),
    );
  }
}
