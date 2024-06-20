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

class ImageBox extends StatelessWidget {
  final String logoUrl;
  final double width;
  final double height;

  const ImageBox({
    super.key,
    required this.logoUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: _Image(logoUrl: logoUrl),
    );
  }
}

class _Image extends StatelessWidget {
  final String logoUrl;

  const _Image({required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    if (logoUrl.isNotEmpty) {
      return Image.network(
        logoUrl,
        errorBuilder: (context, exception, stacktrace) => Container(),
      );
    }

    return Container();
  }
}
