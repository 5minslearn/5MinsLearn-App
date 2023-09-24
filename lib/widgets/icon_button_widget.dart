import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final ButtonStyle? buttonStyle;
  final Function? onPress;
  final Color? iconColor;

  const IconButtonWidget({
    super.key,
    required this.icon,
    this.iconSize,
    this.buttonStyle,
    this.onPress,
    this.iconColor,
  });

  void onPressed() {
    try {
      onPress!();
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: buttonStyle,
      icon: Icon(
        icon,
        size: iconSize ?? 24,
        color: iconColor,
      ),
    );
  }
}
