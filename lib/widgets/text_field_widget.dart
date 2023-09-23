import 'package:fiveminslearn/widgets/banner_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final bool isObscureText;
  final String value;
  final String? label;
  final String? placeholder;
  final Function(String text)? onChanged;
  final String? error;
  final TextInputType? keyboardType;
  final ValueNotifier<bool>? reset;

  const TextFieldWidget({
    super.key,
    required this.value,
    this.onChanged,
    this.isObscureText = false,
    this.label,
    this.placeholder,
    this.error,
    this.keyboardType = TextInputType.text,
    this.reset,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  bool shouldShowPlaceholder = false;
  bool isObscureTextVisible = false;

  @override
  void initState() {
    super.initState();

    _controller.text = widget.value;

    if (widget.reset != null) {
      widget.reset!.addListener(() {
        if (widget.reset != null && widget.reset!.value) {
          _controller.clear();
          handlePlaceholderVisibility(_controller.text);
        }
      });
    }

    handlePlaceholderVisibility(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void handlePlaceholderVisibility(String value) {
    if (value.isEmpty) {
      setState(() {
        shouldShowPlaceholder = true;
      });
    } else {
      setState(() {
        shouldShowPlaceholder = false;
      });
    }
  }

  void onChanged(text) {
    handlePlaceholderVisibility(text);

    try {
      widget.onChanged!(text);
    } catch (e) {
      //
    }
  }

  void handleObscureTextVisibility(bool visible) {
    setState(() {
      isObscureTextVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      children: [
        TextWidget(
          text: widget.label ?? "",
          variant: TextVariant.label,
        ),
        Wrap(
          runSpacing: 10,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  keyboardType: widget.keyboardType,
                  obscureText: widget.isObscureText ? !isObscureTextVisible : false,
                  onChanged: onChanged,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: widget.isObscureText
                        ? isObscureTextVisible
                            ? IconButton(
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                onPressed: () {
                                  handleObscureTextVisibility(false);
                                },
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                onPressed: () {
                                  handleObscureTextVisibility(true);
                                },
                              )
                        : null,
                  ),
                ),
                Positioned(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextWidget(
                        text: shouldShowPlaceholder ? widget.placeholder ?? "" : "",
                        variant: TextVariant.placeholder,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            widget.error != null
                ? BannerWidget(
                    message: widget.error ?? "",
                    variant: BannerVariant.error,
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
