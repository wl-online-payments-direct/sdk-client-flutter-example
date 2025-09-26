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
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_payments_flutter_example/extensions/generic_extensions.dart';
import 'package:online_payments_flutter_example/extensions/result_extensions.dart';
import 'package:online_payments_flutter_example/extensions/string_extensions.dart';
import 'package:online_payments_flutter_example/payment_products_overview/payment_products_overview_page.dart';
import 'package:online_payments_flutter_example/reusable_components/default_button.dart';
import 'package:online_payments_flutter_example/reusable_components/default_padding.dart';
import 'package:online_payments_flutter_example/reusable_components/header_text.dart';
import 'package:online_payments_flutter_example/reusable_components/input_text_form_field.dart';
import 'package:online_payments_flutter_example/reusable_components/label_with_switch.dart';
import 'package:online_payments_flutter_example/reusable_components/loading_spinner.dart';
import 'package:online_payments_flutter_example/reusable_components/ok_dialog.dart';
import 'package:online_payments_flutter_example/reusable_components/sized_box_button.dart';
import 'package:online_payments_flutter_example/reusable_components/vertical_scroll_view.dart';
import 'package:online_payments_repository/models/result.dart';
import 'package:online_payments_repository/models/session_details.dart';
import 'package:online_payments_repository/providers/loading_state_provider.dart';
import 'package:online_payments_repository/providers/payment_details_state_provider.dart';
import 'package:online_payments_repository/providers/payment_products_state_provider.dart';
import 'package:online_payments_repository/providers/session_details_state_provider.dart';
import 'package:online_payments_repository/providers/session_state_provider.dart';
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';

class InitializeSessionPage extends ConsumerWidget {
  const InitializeSessionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const InitializeSessionPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    ref.listen(paymentProductsStateProvider, (previous, next) {
      _processResult(context, next);
      ref
          .read(loadingStateProvider.notifier)
          .updatePaymentProductsLoadingStatus(false);
    });

    return VerticalScrollView(
      childWidget: Form(
        key: formKey,
        child: Column(
          children: [
            const _ClientSessionDetailsInput(),
            const DefaultPadding(),
            const _PaymentDetailsInput(),
            const DefaultPadding(),
            const _OtherOptionsInput(),
            const DefaultPadding(),
            _ProceedButton(
              onButtonPressed: () async {
                // Validate the input fields
                if (formKey.currentState?.validate() ?? false) {
                  // Input fields are valid, create Session
                  SessionDetails sessionDetails =
                      ref.read(sessionDetailsStateProvider);
                  ref
                      .read(sessionStateProvider.notifier)
                      .setSession(sessionDetails);

                  // Execute `getBasicPaymentProducts` call
                  ref
                      .read(paymentProductsStateProvider.notifier)
                      .getBasicPaymentProducts();
                } else {
                  ref
                      .read(loadingStateProvider.notifier)
                      .updatePaymentProductsLoadingStatus(false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _processResult(
    BuildContext context,
    Result<BasicPaymentProducts> result,
  ) {
    result.process(onData: (_) {
      Navigator.push(
        context,
        PaymentProductsOverviewPage.route(),
      );
    }, onErrorResponse: (errorResponse) {
      showDialog(
        context: context,
        builder: (context) => OkDialog(
          titleText: strings.apiErrorTitle,
          messageText: errorResponse.message,
        ),
      );
    }, onNativeException: (nativeException) {
      showDialog(
        context: context,
        builder: (context) => OkDialog(
          titleText: strings.nativeExceptionTitle,
          messageText: nativeException.error,
        ),
      );
    });
  }
}

class _ClientSessionDetailsInput extends ConsumerWidget {
  const _ClientSessionDetailsInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(strings.clientSessionDetailsHeader),
        const DefaultPadding(),
        const _ClientSessionIdInput(),
        const DefaultPadding(),
        const _CustomerIdInput(),
        const DefaultPadding(),
        const _ClientApiUrlInput(),
        const DefaultPadding(),
        const _AssetUrlInput(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              const Spacer(),
              DefaultButton(
                buttonText: strings.pasteJsonButtonLabel,
                onButtonPressed: () {
                  _parseClipboardToSessionDetails()
                      .catchError((error) => null)
                      .then(
                        (sessionDetails) => {
                          sessionDetails.runIfNotNull(
                            (sd) => ref
                                .read(sessionDetailsStateProvider.notifier)
                                .setSessionDetails(sd),
                            onNull: () {
                              // SessionDetails is null, which means that parsing has failed
                              showDialog(
                                context: context,
                                builder: (context) => const OkDialog(
                                  titleText: strings.parsingFailedTitle,
                                  messageText: strings.parsingFailedMessage,
                                ),
                              );
                            },
                          ),
                        },
                      );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<SessionDetails?> _parseClipboardToSessionDetails() async {
    ClipboardData? clipboardData = await Clipboard.getData("text/plain");
    String? clipboardText = clipboardData?.text;

    if (clipboardText == null) return null;

    Map<String, dynamic> sessionDetailsMap = jsonDecode(clipboardText);
    return SessionDetails.fromJson(sessionDetailsMap);
  }
}

class _ClientSessionIdInput extends ConsumerWidget {
  const _ClientSessionIdInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.clientSessionIdLabel,
      tooltipText: strings.clientSessionIdTooltip,
      value: ref.watch(
        sessionDetailsStateProvider.select((value) => value.clientSessionId),
      ),
      onInputChanged: (value) => ref
          .read(sessionDetailsStateProvider.notifier)
          .updateClientSessionId(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _CustomerIdInput extends ConsumerWidget {
  const _CustomerIdInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.customerIdLabel,
      tooltipText: strings.customerIdTooltip,
      value: ref.watch(
        sessionDetailsStateProvider.select((value) => value.customerId),
      ),
      onInputChanged: (value) => ref
          .read(sessionDetailsStateProvider.notifier)
          .updateCustomerId(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _ClientApiUrlInput extends ConsumerWidget {
  const _ClientApiUrlInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.clientApiUrlLabel,
      tooltipText: strings.clientApiUrlTooltip,
      value: ref.watch(
        sessionDetailsStateProvider.select((value) => value.clientApiUrl),
      ),
      onInputChanged: (value) => ref
          .read(sessionDetailsStateProvider.notifier)
          .updateClientApiUrl(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _AssetUrlInput extends ConsumerWidget {
  const _AssetUrlInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.assetsUrlLabel,
      tooltipText: strings.assetsUrlTooltip,
      value: ref.watch(
        sessionDetailsStateProvider.select((value) => value.assetUrl),
      ),
      onInputChanged: (value) =>
          ref.read(sessionDetailsStateProvider.notifier).updateAssetUrl(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _PaymentDetailsInput extends ConsumerWidget {
  const _PaymentDetailsInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(strings.paymentDetailsHeader),
        DefaultPadding(),
        _AmountInCentsInput(),
        DefaultPadding(),
        _CountryCodeInput(),
        DefaultPadding(),
        _CurrencyCodeInput(),
      ],
    );
  }
}

class _AmountInCentsInput extends ConsumerWidget {
  const _AmountInCentsInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.amountInCentsLabel,
      tooltipText: strings.amountInCentsTooltip,
      value: ref.watch(
        paymentDetailsStateProvider.select(
            (value) => value.paymentContext.amountOfMoney.amount.toString()),
      ),
      keyboardType: TextInputType.number,
      textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onInputChanged: (value) {
        final int parsedAmount = int.tryParse(value) ?? 0;
        ref
            .read(paymentDetailsStateProvider.notifier)
            .updateAmountInCents(parsedAmount);
      },
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _CountryCodeInput extends ConsumerWidget {
  const _CountryCodeInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.countryCodeLabel,
      tooltipText: strings.countryCodeTooltip,
      value: ref.watch(
        paymentDetailsStateProvider
            .select((value) => value.paymentContext.countryCode),
      ),
      onInputChanged: (value) => ref
          .read(paymentDetailsStateProvider.notifier)
          .updateCountryCode(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _CurrencyCodeInput extends ConsumerWidget {
  const _CurrencyCodeInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.currencyCodeLabel,
      tooltipText: strings.currencyCodeTooltip,
      value: ref.watch(
        paymentDetailsStateProvider
            .select((value) => value.paymentContext.amountOfMoney.currencyCode),
      ),
      onInputChanged: (value) => ref
          .read(paymentDetailsStateProvider.notifier)
          .updateCurrencyCode(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _OtherOptionsInput extends ConsumerWidget {
  const _OtherOptionsInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool applePayEnabled = ref.watch(
      paymentDetailsStateProvider.select((value) => value.applePayEnabled),
    );
    bool googlePayEnabled = ref.watch(
      paymentDetailsStateProvider.select((value) => value.googlePayEnabled),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(strings.otherOptionsHeader),
        const _RecurringPaymentSwitch(),
        const _EnableLoggingSwitch(),
        // Only show ApplePay on iOS devices
        if (defaultTargetPlatform == TargetPlatform.iOS) const _ApplePaySwitch(),
        // Only show one _MerchantIdInput if both applePay and googlePay are enabled
        if (applePayEnabled && !googlePayEnabled) ...[
          DefaultPadding.all(size: 5),
          const _MerchantIdInput(),
        ],
        const _GooglePaySwitch(),
        if (googlePayEnabled) ...[
          DefaultPadding.all(size: 5),
          const _MerchantIdInput(),
          const DefaultPadding(),
          const _MerchantNameInput(),
        ],
      ],
    );
  }
}

class _RecurringPaymentSwitch extends ConsumerWidget {
  const _RecurringPaymentSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LabelWithSwitch(
      label: strings.recurringPaymentLabel,
      tooltipText: strings.recurringPaymentTooltip,
      isEnabled: ref.watch(
        paymentDetailsStateProvider
            .select((value) => value.paymentContext.isRecurring),
      ),
      onValueChanged: (value) =>
          ref.read(paymentDetailsStateProvider.notifier).isRecurring(value),
    );
  }
}

class _EnableLoggingSwitch extends ConsumerWidget {
  const _EnableLoggingSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LabelWithSwitch(
      label: strings.enableLoggingLabel,
      tooltipText: strings.enableLoggingTooltip,
      isEnabled: ref.watch(
        sessionDetailsStateProvider.select((value) => value.enableLogging),
      ),
      onValueChanged: (value) =>
          ref.read(sessionDetailsStateProvider.notifier).enableLogging(value),
    );
  }
}

class _ApplePaySwitch extends ConsumerWidget {
  const _ApplePaySwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LabelWithSwitch(
      label: strings.applePayLabel,
      isEnabled: ref.watch(
        paymentDetailsStateProvider.select((value) => value.applePayEnabled),
      ),
      onValueChanged: (value) =>
          ref.read(paymentDetailsStateProvider.notifier).enableApplePay(value),
    );
  }
}

class _GooglePaySwitch extends ConsumerWidget {
  const _GooglePaySwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LabelWithSwitch(
      label: strings.googlePayLabel,
      isEnabled: ref.watch(
        paymentDetailsStateProvider.select((value) => value.googlePayEnabled),
      ),
      onValueChanged: (value) =>
          ref.read(paymentDetailsStateProvider.notifier).enableGooglePay(value),
    );
  }
}

class _MerchantIdInput extends ConsumerWidget {
  const _MerchantIdInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.merchantIdLabel,
      tooltipText: strings.merchantIdTooltip,
      value: ref.watch(
        paymentDetailsStateProvider.select((value) => value.merchantId),
      ),
      onInputChanged: (value) => ref
          .read(paymentDetailsStateProvider.notifier)
          .updateMerchantId(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _MerchantNameInput extends ConsumerWidget {
  const _MerchantNameInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputTextFormField(
      label: strings.merchantNameLabel,
      tooltipText: strings.merchantNameTooltip,
      value: ref.watch(
        paymentDetailsStateProvider.select((value) => value.merchantName),
      ),
      onInputChanged: (value) => ref
          .read(paymentDetailsStateProvider.notifier)
          .updateMerchantName(value),
      validate: (value) => value.validateNullOrEmpty(),
    );
  }
}

class _ProceedButton extends ConsumerWidget {
  final VoidCallback onButtonPressed;

  const _ProceedButton({required this.onButtonPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      loadingStateProvider.select(
        ((value) => value.isLoadingPaymentProducts),
      ),
    );

    if (isLoading) {
      return const LoadingSpinner();
    } else {
      return SizedBoxButton(
        buttonText: strings.proceedButtonLabel,
        onButtonPressed: () {
          // Set loading state so that button cannot be double pressed
          ref
              .read(loadingStateProvider.notifier)
              .updatePaymentProductsLoadingStatus(true);
          onButtonPressed();
        },
      );
    }
  }
}
