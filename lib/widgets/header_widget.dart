import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final bool shouldShowBackArrow;
  final bool shouldShowMoreMenu;
  final String title;
  final Function? goBack;

  const HeaderWidget({
    super.key,
    this.shouldShowBackArrow = false,
    this.shouldShowMoreMenu = false,
    required this.title,
    this.goBack,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  void goBack() {
    try {
      widget.goBack!();
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          widget.shouldShowBackArrow
              ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: IconButton(
                    onPressed: goBack,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                )
              : const SizedBox(
                  width: 50,
                ),
          TextWidget(
            variant: TextVariant.title,
            style: const TextStyle(color: Colors.black87),
            text: widget.title,
          ),
          widget.shouldShowMoreMenu
              ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.more_vert_rounded,
                    ),
                  ),
                )
              : const SizedBox(
                  width: 50,
                ),
        ],
      ),
    );
  }
}
