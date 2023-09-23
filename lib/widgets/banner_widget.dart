import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

enum BannerVariant {
  error,
  info,
  success,
  warn,
  normal,
}

class BannerVariantData {
  late Color textColor;
  late Color iconColor;
  late Color backgroundColor;

  BannerVariantData({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });
}

class BannerWidget extends StatefulWidget {
  final String message;
  final BannerVariant? variant;

  const BannerWidget({super.key, required this.message, this.variant = BannerVariant.normal});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final Map<BannerVariant, BannerVariantData> variant = {
    BannerVariant.error: BannerVariantData(
      textColor: Colors.red.shade300,
      iconColor: Colors.red.shade300,
      backgroundColor: Colors.red.shade50,
    ),
    BannerVariant.warn: BannerVariantData(
      textColor: Colors.yellow.shade700,
      iconColor: Colors.yellow.shade700,
      backgroundColor: Colors.yellow.shade100,
    ),
    BannerVariant.info: BannerVariantData(
      textColor: Colors.blue.shade300,
      iconColor: Colors.blue.shade300,
      backgroundColor: Colors.blue.shade50,
    ),
    BannerVariant.success: BannerVariantData(
      textColor: Colors.lightGreen.shade500,
      iconColor: Colors.lightGreen.shade500,
      backgroundColor: Colors.lightGreen.shade50,
    ),
    BannerVariant.normal: BannerVariantData(
      textColor: Colors.black,
      iconColor: Colors.black87,
      backgroundColor: Colors.black12,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: variant[widget.variant]?.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextWidget(
                text: widget.message,
                variant: TextVariant.helper,
                style: TextStyle(
                  color: variant[widget.variant]?.textColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.info,
              color: variant[widget.variant]?.iconColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
