import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final String? text;

  const DividerWidget({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        text != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextWidget(
                  text: text!,
                  variant: TextVariant.helper,
                ),
              )
            : const SizedBox(),
        text != null ? const Expanded(child: Divider()) : const SizedBox(),
      ],
    );
  }
}
