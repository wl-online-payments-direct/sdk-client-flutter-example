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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_payments_flutter_example/reusable_components/modal_bottom_sheet.dart';

import 'default_text.dart';

class LabelWithSwitch extends ConsumerWidget {
  final String label;
  final bool labelIsMultiLine;
  final double fontSize;
  final String? tooltipText;
  final bool isEnabled;
  final Function(bool) onValueChanged;

  const LabelWithSwitch({
    super.key,
    required this.label,
    this.labelIsMultiLine = false,
    this.fontSize = 17,
    this.tooltipText,
    required this.isEnabled,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        if (labelIsMultiLine) ...[
          SizedBox(
            width: 250,
            child: DefaultText(label, fontSize: fontSize),
          ),
        ] else
          DefaultText(label, fontSize: fontSize),
        // Only show the tooltip if required
        if (tooltipText != null)
          Tooltip(
            message: tooltipText,
            child: IconButton(
              icon: const Icon(Icons.info_outlined),
              color: Colors.black54,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalBottomSheet(text: tooltipText!);
                  },
                );
              },
            ),
          ),
        const Spacer(),
        Switch(
          value: isEnabled,
          activeColor: Colors.green,
          trackOutlineColor: isEnabled
              ? const WidgetStatePropertyAll(Colors.green)
              : const WidgetStatePropertyAll(Colors.grey),
          thumbColor: isEnabled
              ? const WidgetStatePropertyAll(Colors.green)
              : const WidgetStatePropertyAll(Colors.grey),
          onChanged: (value) => onValueChanged(value),
        )
      ],
    );
  }
}
