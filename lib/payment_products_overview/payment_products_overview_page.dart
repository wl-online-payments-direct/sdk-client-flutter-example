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
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_payments_flutter_example/card_product/card_product_page.dart';
import 'package:online_payments_flutter_example/end/end_page.dart';
import 'package:online_payments_flutter_example/extensions/generic_extensions.dart';
import 'package:online_payments_flutter_example/extensions/result_extensions.dart';
import 'package:online_payments_flutter_example/image/image_box.dart';
import 'package:online_payments_flutter_example/reusable_components/default_padding.dart';
import 'package:online_payments_flutter_example/reusable_components/default_text.dart';
import 'package:online_payments_flutter_example/reusable_components/header_text.dart';
import 'package:online_payments_flutter_example/reusable_components/loading_spinner.dart';
import 'package:online_payments_flutter_example/reusable_components/modal_bottom_sheet.dart';
import 'package:online_payments_flutter_example/reusable_components/ok_dialog.dart';
import 'package:online_payments_flutter_example/reusable_components/vertical_scroll_view.dart';
import 'package:online_payments_repository/constants.dart' as constants;
import 'package:online_payments_repository/helpers/wallet_payment_helper.dart';
import 'package:online_payments_repository/models/payment_details.dart';
import 'package:online_payments_repository/models/result.dart';
import 'package:online_payments_repository/providers/card_input_state_provider.dart';
import 'package:online_payments_repository/providers/encrypted_payment_request_state_provider.dart';
import 'package:online_payments_repository/providers/loading_state_provider.dart';
import 'package:online_payments_repository/providers/payment_details_state_provider.dart';
import 'package:online_payments_repository/providers/payment_product_state_provider.dart';
import 'package:online_payments_repository/providers/payment_products_state_provider.dart';
import 'package:online_payments_repository/strings.dart' as strings;
import 'package:online_payments_sdk/online_payments_sdk.dart';

class PaymentProductsOverviewPage extends ConsumerWidget {
  const PaymentProductsOverviewPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const PaymentProductsOverviewPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BasicPaymentProducts? basicPaymentProducts =
        ref.read(paymentProductsStateProvider).data;
    final PaymentDetails paymentDetails = ref.read(paymentDetailsStateProvider);
    final isLoading = ref.watch(
      loadingStateProvider.select(
        ((value) => value.isLoadingPaymentProduct),
      ),
    );

    ref.listen(
      paymentProductStateProvider.select((value) => value.paymentProductResult),
      (previous, next) {
        _processResult(
          context,
          next,
          paymentDetails,
          (paymentRequest) => ref
              .read(encryptedPaymentRequestStateProvider.notifier)
              .encryptPaymentRequest(paymentRequest),
        );
        ref
            .read(loadingStateProvider.notifier)
            .updatePaymentProductLoadingStatus(false);
      },
    );

    ref.listen(encryptedPaymentRequestStateProvider, (previous, next) {
      _onRequestEncrypted(context, next);
      ref
          .read(cardInputStateProvider.notifier)
          .toggleLiveValidationEnabled(false);
      ref
          .read(loadingStateProvider.notifier)
          .updateEncryptPaymentLoadingStatus(false);
    });

    return VerticalScrollView(
      childWidget: DefaultPadding.horizontal(
        child: Column(
          children: [
            if (isLoading)
              const LoadingSpinner()
            else if (basicPaymentProducts != null) ...[
              if (basicPaymentProducts.accountsOnFile.isNotEmpty) ...[
                const HeaderText(strings.accountsOnFileHeader),
                for (var aof in basicPaymentProducts.accountsOnFile)
                  _getBasicPaymentProduct(basicPaymentProducts, aof)
                      .runIfNotNull(
                    (bpp) {
                      return DefaultPadding.vertical(
                        child: _PaymentProductItem(
                          basicPaymentProduct: bpp,
                          accountOnFile: aof,
                        ),
                      );
                    },
                    onNull: () => Container(),
                  ),
                const HeaderText(strings.paymentProductsHeader),
              ],
              for (var basicPaymentProduct in basicPaymentProducts.products)
                DefaultPadding.vertical(
                  child: _PaymentProductItem(
                    basicPaymentProduct: basicPaymentProduct,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  BasicPaymentProduct? _getBasicPaymentProduct(
    BasicPaymentProducts basicPaymentProducts,
    AccountOnFile accountOnFile,
  ) {
    return basicPaymentProducts
        .getBasicPaymentProductById(accountOnFile.paymentProductId);
  }

  void _processResult(
    BuildContext context,
    Result<PaymentProduct> result,
    PaymentDetails paymentDetails,
    Function(PaymentRequest) onWalletPaymentSuccess,
  ) {
    result.process(onData: (paymentProduct) {
      // This example only shows how to use GooglePay and ApplePay on their respective platforms
      if (Platform.isAndroid &&
              paymentProduct.id == constants.paymentProductIdGooglePay ||
          Platform.isIOS &&
              paymentProduct.id == constants.paymentProductIdApplePay) {
        WalletPaymentHelper.startWalletPayment(
          paymentProduct,
          paymentDetails,
          onWalletPaymentSuccess,
        );
      } else if (paymentProduct.paymentMethod == constants.cardPaymentMethod) {
        Navigator.push(
          context,
          CardProductPage.route(),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const ModalBottomSheet(
              text: strings.productNotAvailableLabel,
            );
          },
        );
      }
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

  void _onRequestEncrypted(
    BuildContext context,
    Result<PreparedPaymentRequest> result,
  ) {
    result.process(onData: (preparedPaymentRequest) {
      /*
      Send the PreparedPaymentRequest to the merchant server, this contains a blob of encrypted values + base64encoded metadata

      Depending on the response from the merchant server, redirect to one of the following pages:
      - Successful page if the payment is done
      - Unsuccessful page when the payment result is unsuccessful, you must supply a paymentProductId and an errorCode which will be translated
      - Webview page to show an instructions page, or to go to a third party payment page
      */
      Navigator.push(
        context,
        EndPage.route(),
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

class _PaymentProductItem extends ConsumerWidget {
  final BasicPaymentProduct basicPaymentProduct;
  final AccountOnFile? accountOnFile;

  const _PaymentProductItem({
    required this.basicPaymentProduct,
    this.accountOnFile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: _PaymentProductItemContainer(
        text: _getLabel(),
        logoUrl: basicPaymentProduct.displayHintsList[0].logoUrl,
      ),
      onTap: () {
        _onTapAction(onSupportedProduct: () {
          ref
              .read(loadingStateProvider.notifier)
              .updatePaymentProductLoadingStatus(true);
          // If basicPaymentProduct is 'card', call getPaymentProduct & progress to the next screen
          ref
              .read(paymentProductStateProvider.notifier)
              .getPaymentProduct(basicPaymentProduct.id, accountOnFile);
        }, showProductNotAvailable: () {
          // If basicPaymentProduct is not 'card', show bottom sheet with text that product is not implemented
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const ModalBottomSheet(
                text: strings.productNotAvailableLabel,
              );
            },
          );
        });
      },
    );
  }

  String _getLabel() {
    return accountOnFile.runIfNotNull(
      (aof) => aof.getLabel(),
      onNull: () => basicPaymentProduct.displayHintsList[0].label,
    );
  }

  void _onTapAction({
    required VoidCallback onSupportedProduct,
    required VoidCallback showProductNotAvailable,
  }) {
    if (basicPaymentProduct.paymentMethod == constants.cardPaymentMethod ||
        basicPaymentProduct.id == constants.paymentProductIdGooglePay ||
        basicPaymentProduct.id == constants.paymentProductIdApplePay) {
      onSupportedProduct();
    } else {
      showProductNotAvailable();
    }
  }
}

class _PaymentProductItemContainer extends StatelessWidget {
  final String text;
  final String logoUrl;

  const _PaymentProductItemContainer({
    required this.text,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            ImageBox(logoUrl: logoUrl, width: 30, height: 50),
            DefaultPadding.onlyLeft(
              child: DefaultText(text),
            ),
          ],
        ),
      ),
    );
  }
}
