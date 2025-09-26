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
/// Initialize Session page *
const String merchantLogoLabel = "Merchant logo";
const String lockLogoLabel = "Security lock";
const String securePaymentLabel = "Secure payment";
const String proceedButtonLabel = "Proceed to checkout";

/* Client Session Details */
const String clientSessionDetailsHeader = "Client session details";
const String clientSessionIdLabel = "Client session ID";
const String clientSessionIdTooltip =
    "Returned in the Server to Server Create Client Session call. This is the identifier of the current session.";
const String customerIdLabel = "Customer ID";
const String customerIdTooltip =
    "Returned in the Server to Server Create Client Session call. This is a temporary identifier for you within the session.";
const String clientApiUrlLabel = "Client API URL";
const String clientApiUrlTooltip =
    "Returned in the Server to Server Create Client Session call. This URL points to the Online Payments Client API.";
const String assetsUrlLabel = "Assets URL";
const String assetsUrlTooltip =
    "Returned in the Server to Server Create Client Session call. This URL can be used to retrieve static resources, such as payment product logo images.";
const String pasteJsonButtonLabel = "Paste client session JSON response";

/* Payment Details */
const String paymentDetailsHeader = "Payment details";
const String amountInCentsLabel = "Amount in cents";
const String amountInCentsTooltip =
    "The amount that will be used for this payment. Note that the value must be provided in the smallest possible denominator for the currency.";
const String countryCodeLabel = "Country code";
const String countryCodeTooltip =
    "The ISO 3166-1 alpha-2 standard 2-letter Country Code of the consumer.";
const String currencyCodeLabel = "Currency code";
const String currencyCodeTooltip =
    "The ISO 4217 standard 3-letter Currency Code of the currency in which the payment will be made.";

/* Other options */
const String otherOptionsHeader = "Other options";
const String recurringPaymentLabel = "Payment is recurring";
const String recurringPaymentTooltip =
    "Indicates whether the payment product that is used for this payment should support recurring payments. If enabled, products not supporting recurring will be filtered.";
const String enableLoggingLabel = "Enable logging";
const String enableLoggingTooltip =
    "Indicates whether requests and responses should be logged to the console.";
const String applePayLabel = "Apple Pay";
const String googlePayLabel = "Google Pay";
const String merchantIdLabel = "Merchant ID";
const String merchantIdTooltip =
    "Your Worldline merchant ID. You can find this ID in the Configuration Center.";
const String merchantNameLabel = "Merchant name";
const String merchantNameTooltip =
    "The name of your business which will be shown to customers in the Payment Sheet and in payment overviews.";

/// Payment products overview page *
const String accountsOnFileHeader = "Previously used accounts";
const String paymentProductsHeader = "Other payment products";
const String productNotAvailableLabel =
    "The product you selected is currently not available, please select another one.";

/// Card product page *
const String rememberPaymentDetailsLabel =
    "Remember my payment details for future purchases";
const String payButtonLabel = "Pay";
const String cardPlaceholderLabel = "**** **** **** ****";
const String expiryDatePlaceholderLabel = "MM/YY";
const String expiryDateFullYearPlaceholderLabel = "MM/YYYY";
const String cvvPlaceholderLabel = "123";
const String securityCodePlaceholderLabel = "123";
const String cardHolderPlaceholderLabel = "John Doe";
const String iinNotEnoughDigitsLabel =
    "Not enough digits were entered. Please enter at least 6 digits";
const String errorRetrievingProductLabel =
    "The product could not be retrieved. Please select another product";

/// End page *
const String successHeader = "Success!";
const String endScreenInstructionLabel =
    "Tap below to copy the encrypted fields that must be used in the Create Payment request.";
const String showEncryptedFieldsButtonLabel = "Show encrypted fields data";
const String hideEncryptedFieldsButtonLabel = "Hide encrypted fields data";
const String encryptedFieldsHeader = "Encrypted fields:";
const String copyEncryptedFieldsButtonLabel =
    "Copy encrypted fields to clipboard";
const String copiedEncryptedFieldsLabel =
    "Encrypted fields copied successfully";
const String returnToStartButtonLabel = "Return to start";

/// Errors *
const String apiErrorTitle = "API error";
const String nativeExceptionTitle = "Native exception";
const String parsingFailedTitle = "Parsing failed";
const String parsingFailedMessage =
    "Please paste a properly formatted JSON string.";
const String emptyFieldValidationMessage = "This field should not be empty";
const String errorLoggingWalletPayment =
    "Exception occurred during Wallet Payment : ";

/// OK dialog *
const String okLabel = "OK";

/// Validation error messages *
const String defaultError = "Please provide a valid value";
Map<String, String> _validationErrorMessagesMap = {
  'allowedInContext':
      "The card you entered is not supported. Please enter another card or try another payment method.",
  'cardholderName': "Please provide the name as exactly written on your card",
  'emailAddress': "Please provide a valid email address",
  'expirationDate': "Please provide a valid expiration date",
  'fixedList': "Please select one of the values from the list",
  'iban': "Please enter a valid IBAN",
  'iin': "Please provide a valid card number",
  'invalidContent': "Please provide a value of the correct format",
  'length.between':
      "Please provide a value between {minLength} and {maxLength} characters",
  'length.exact': "Please provide a value of exactly {maxLength} characters",
  'length': "Please provide a value of the correct length",
  'length.max': "Please provide a value of maximum of {maxLength} characters",
  'luhn': "Please provide a valid card number",
  'range': "Please provide a value between {minValue} and {maxValue}",
  'regularExpression': "Please provide a value of the correct format",
  'required': "Please provide a value",
  'residentIdName':
      "Please provide the exact name as written on your Resident Identity Card",
  'residentIdNumber':
      "Please provide the exact number as written on your Resident Identity Card",
  'termsAndConditions': "Please accept the terms and conditions"
};

String getValidationErrorMessage(String errorMessageKey) {
  if (_validationErrorMessagesMap.containsKey(errorMessageKey)) {
    return _validationErrorMessagesMap[errorMessageKey]!;
  } else {
    return defaultError;
  }
}
