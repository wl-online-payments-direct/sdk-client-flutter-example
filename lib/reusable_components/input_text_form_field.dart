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
import 'package:online_payments_flutter_example/extensions/generic_extensions.dart';
import 'package:online_payments_flutter_example/image/image_box.dart';
import 'package:online_payments_flutter_example/reusable_components/default_padding.dart';
import 'package:online_payments_flutter_example/reusable_components/modal_bottom_sheet.dart';

class InputTextFormField extends ConsumerStatefulWidget {
  final String? label;
  final String? hint;
  final String? tooltipText;
  final String? errorText;
  final String? value;
  final Icon? prefixIcon;
  final String? suffixImageUrl;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatters;
  final bool enabled;
  final Function(String) onInputChanged;
  final Function(String?)? validate;

  const InputTextFormField({
    super.key,
    this.label,
    this.tooltipText,
    this.errorText,
    this.hint,
    required this.value,
    this.prefixIcon,
    this.suffixImageUrl,
    this.keyboardType,
    this.textInputFormatters,
    this.enabled = true,
    required this.onInputChanged,
    this.validate,
  });

  @override
  ConsumerState<InputTextFormField> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends ConsumerState<InputTextFormField> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // When using the 'Paste session JSON response'-feature, this if-statement ensures that the pasted JSON is also shown in the TextFormField
    // All other times, this if-statement will be skipped
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (textEditingController.text != widget.value) {
        textEditingController.text = widget.value ?? '';
      }
    });

    return Column(
      children: [
        TextFormField(
          controller: textEditingController,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.textInputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: widget.enabled,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? DefaultPadding.all(child: widget.prefixIcon)
                : null,
            labelText: widget.label,
            hintText: widget.hint,
            errorText: widget.errorText,
            errorMaxLines: 3,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            border: const OutlineInputBorder(),
            labelStyle: const TextStyle(color: Colors.black54),
            suffixIcon:
                (widget.tooltipText != null || widget.suffixImageUrl != null)
                    ? _SuffixWidget(
                        tooltipText: widget.tooltipText,
                        suffixImageUrl: widget.suffixImageUrl)
                    : null,
          ),
          onChanged: (value) => widget.onInputChanged(value),
          validator: (value) => widget.validate?.call(value),
        )
      ],
    );
  }
}

class _SuffixWidget extends StatelessWidget {
  final String? tooltipText;
  final String? suffixImageUrl;

  const _SuffixWidget({this.tooltipText, this.suffixImageUrl});

  @override
  Widget build(BuildContext context) {
    if (suffixImageUrl != null && tooltipText != null) {
      return DefaultPadding.onlyRight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            suffixImageUrl.runIfNotNull(
              (url) {
                return _TooltipLogo(logoUrl: url);
              },
              onNull: () => Container(),
            ),
            tooltipText.runIfNotNull(
              (text) {
                return _Tooltip(tooltipText: text);
              },
              onNull: () => Container(),
            )
          ],
        ),
      );
    } else if (suffixImageUrl != null) {
      return suffixImageUrl.runIfNotNull(
        (url) {
          return DefaultPadding.onlyRight(
            child: _TooltipLogo(logoUrl: url),
          );
        },
        onNull: () => Container(),
      );
    } else {
      return tooltipText.runIfNotNull(
        (text) {
          return _Tooltip(tooltipText: text);
        },
        onNull: () => Container(),
      );
    }
  }
}

class _TooltipLogo extends StatelessWidget {
  final String logoUrl;

  const _TooltipLogo({required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return ImageBox(logoUrl: logoUrl, width: 30, height: 30);
  }
}

class _Tooltip extends StatelessWidget {
  final String tooltipText;

  const _Tooltip({required this.tooltipText});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      child: IconButton(
        icon: const Icon(Icons.info_outlined),
        color: Colors.black54,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ModalBottomSheet(
                text: tooltipText,
              );
            },
          );
        },
      ),
    );
  }
}
