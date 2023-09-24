import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget? child;
  final Function? onPress;
  final Color? color;
  final ShapeBorder? shape;

  const CardWidget({
    super.key,
    this.child,
    this.onPress,
    this.color,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    void onTap() {
      try {
        onPress!();
      } catch (e) {
        //
      }
    }

    return InkWell(
      onTap: onTap,
      child: Card(
        shape: shape ??
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1)),
            ),
        color: color,
        child: child,
      ),
    );
  }
}