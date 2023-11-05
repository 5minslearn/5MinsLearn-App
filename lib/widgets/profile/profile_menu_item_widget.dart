import 'package:fiveminslearn/widgets/divider_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final String title;
  final Function()? onPress;
  final IconData? rightIcon;
  final Color? rightIconColor;
  final IconData? leftIcon;
  final Color? leftIconColor;

  const ProfileMenuItemWidget({
    super.key,
    required this.title,
    this.onPress,
    this.rightIcon,
    this.rightIconColor,
    this.leftIcon,
    this.leftIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 16.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (leftIcon != null)
                      Icon(
                        leftIcon,
                        color: leftIconColor ?? Colors.blue,
                      ),
                    TextWidget(
                      text: title,
                      variant: TextVariant.text,
                    ),
                  ],
                ),
                Icon(
                  rightIcon ?? Icons.arrow_forward_ios,
                  color: rightIconColor ?? Colors.blue.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ),
        const DividerWidget(),
      ],
    );
  }
}
