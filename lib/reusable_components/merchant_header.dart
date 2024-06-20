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
import 'package:online_payments_repository/strings.dart' as strings;

import 'default_padding.dart';

class MerchantHeader extends StatelessWidget {
  const MerchantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultPadding.horizontal(
          size: 40,
          child: Image.asset(
            'assets/images/logo_merchant.png',
            semanticLabel: strings.merchantLogoLabel,
          ),
        ),
        const DefaultPadding(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/lock.png',
              semanticLabel: strings.lockLogoLabel,
              height: 17,
              width: 17,
            ),
            DefaultPadding.all(size: 5),
            const Text(
              strings.securePaymentLabel,
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            const DefaultPadding(),
          ],
        ),
      ],
    );
  }
}
