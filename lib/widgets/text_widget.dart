import 'package:flutter/material.dart';

enum TextVariant {
  text,
  placeholder,
  button,
  title,
  helper,
  error,
  label,
}

class TextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextVariant variant;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  const TextWidget({
    super.key,
    required this.text,
    this.style,
    this.variant = TextVariant.text,
    this.maxLines,
    this.overflow,
    this.softWrap,
  });

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final Map<TextVariant, TextStyle> variant = {
    TextVariant.text: const TextStyle(
      fontSize: 19,
      color: Colors.black,
    ),
    TextVariant.placeholder: const TextStyle(
      fontSize: 18,
      color: Colors.grey,
    ),
    TextVariant.button: const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    TextVariant.title: const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    TextVariant.helper: const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    TextVariant.error: const TextStyle(
      fontSize: 16,
      color: Colors.red,
    ),
    TextVariant.label: const TextStyle(
      fontSize: 18,
      color: Colors.black,
    )
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: variant[widget.variant],
      child: Text(
        widget.text,
        maxLines: widget.maxLines,
        overflow: widget.overflow ?? TextOverflow.ellipsis,
        softWrap: widget.softWrap ?? true,
        style: widget.style,
      ),
    );
  }
}
