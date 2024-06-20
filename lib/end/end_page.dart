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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_payments_flutter_example/reusable_components/default_button.dart';
import 'package:online_payments_flutter_example/reusable_components/default_padding.dart';
import 'package:online_payments_flutter_example/reusable_components/default_text.dart';
import 'package:online_payments_flutter_example/reusable_components/header_text.dart';
import 'package:online_payments_flutter_example/reusable_components/vertical_scroll_view.dart';
import 'package:online_payments_repository/providers/card_input_state_provider.dart';
import 'package:online_payments_repository/providers/encrypted_payment_request_state_provider.dart';
import 'package:online_payments_repository/providers/loading_state_provider.dart';
import 'package:online_payments_repository/providers/payment_products_state_provider.dart';
import 'package:online_payments_repository/providers/session_state_provider.dart';
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';

class EndPage extends ConsumerStatefulWidget {
  const EndPage({super.key});

  @override
  ConsumerState<EndPage> createState() => _EndPageState();

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const EndPage(),
    );
  }
}

class _EndPageState extends ConsumerState<EndPage> {
  bool showEncryptedFields = false;

  @override
  Widget build(BuildContext context) {
    final PreparedPaymentRequest? preparedPaymentRequest =
        ref.read(encryptedPaymentRequestStateProvider).data;

    return VerticalScrollView(
      showMerchantHeader: false,
      childWidget: DefaultPadding.horizontal(
        child: Column(
          children: [
            const HeaderText(
              strings.successHeader,
              fontSize: 30,
            ),
            const DefaultPadding(),
            const DefaultText(strings.endScreenInstructionLabel),
            const DefaultPadding(),
            DefaultButton(
              foregroundColor: Colors.blue,
              buttonText: showEncryptedFields
                  ? strings.hideEncryptedFieldsButtonLabel
                  : strings.showEncryptedFieldsButtonLabel,
              onButtonPressed: () {
                setState(() {
                  showEncryptedFields = !showEncryptedFields;
                });
              },
            ),
            if (showEncryptedFields) ...[
              const DefaultPadding(),
              const HeaderText(
                strings.encryptedFieldsHeader,
                fontSize: 17,
              ),
              DefaultText(preparedPaymentRequest?.encryptedFields ?? ""),
            ],
            const DefaultPadding(),
            DefaultButton(
              buttonText: strings.copyEncryptedFieldsButtonLabel,
              onButtonPressed: () => _copyToClipboard(
                preparedPaymentRequest?.encryptedFields ?? "",
                onSuccessfullyCopied: () {
                  const snackBar = SnackBar(
                    content: Text(strings.copiedEncryptedFieldsLabel),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            const DefaultPadding(),
            DefaultButton(
              foregroundColor: Colors.red,
              buttonText: strings.returnToStartButtonLabel,
              onButtonPressed: () {
                // Reset providers that are not disposed automatically
                ref.invalidate(sessionStateProvider);
                ref.invalidate(paymentProductsStateProvider);
                ref.invalidate(cardInputStateProvider);
                ref.invalidate(loadingStateProvider);
                // Pop all routes to go back to the first screen
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _copyToClipboard(
    String text, {
    required VoidCallback onSuccessfullyCopied,
  }) async {
    final clipboardData = ClipboardData(text: text);
    await Clipboard.setData(clipboardData);
    onSuccessfullyCopied();
  }
}
