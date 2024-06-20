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

import 'app_wrapper.dart';
import 'default_padding.dart';
import 'merchant_header.dart';

class VerticalScrollView extends StatelessWidget {
  final Widget childWidget;
  final bool showMerchantHeader;

  const VerticalScrollView({
    super.key,
    this.showMerchantHeader = true,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      childWidget: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showMerchantHeader) const MerchantHeader(),
            Expanded(
              child: DefaultPadding.all(
                size: 20,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: childWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
