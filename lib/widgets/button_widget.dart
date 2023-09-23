import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final Function? onPressed;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  void onPressed() {
    try {
      widget.onPressed!();
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            widget.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
            TextWidget(
              text: widget.label,
              variant: TextVariant.button,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
