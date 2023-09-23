import 'package:flutter/material.dart';

class DefaultDividerWidget extends StatelessWidget {
  final Color? color;
  final double? thickness;

  const DefaultDividerWidget({super.key, this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.grey,
      thickness: thickness ?? 1,
    );
  }
}
