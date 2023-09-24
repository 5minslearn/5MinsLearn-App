import 'package:fiveminslearn/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

class BlogActionWidget extends StatelessWidget {
  final Function? onPressShare;
  final Function? onPressAddBookMark;
  final Function? onPressRemoveBookMark;
  final Function? onPressMore;
  final bool? isBookMarked;

  const BlogActionWidget({
    super.key,
    this.onPressShare,
    this.onPressAddBookMark,
    this.onPressRemoveBookMark,
    this.onPressMore,
    this.isBookMarked,
  });

  void onPressedShare() {
    try {
      onPressShare!();
    } catch (e) {
      //
    }
  }

  void onPressedAddBookMark() {
    try {
      onPressAddBookMark!();
    } catch (e) {
      //
    }
  }

  void onPressedRemoveBookMark() {
    try {
      onPressRemoveBookMark!();
    } catch (e) {
      //
    }
  }

  void onPressedMore() {
    try {
      onPressMore!();
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Wrap(
          spacing: 5,
          children: [
            IconButtonWidget(
              icon: Icons.share,
              onPress: onPressedShare,
            ),
            if (isBookMarked != null)
              isBookMarked!
                  ? IconButtonWidget(
                      icon: Icons.bookmark_remove,
                      onPress: onPressedRemoveBookMark,
                    )
                  : IconButtonWidget(
                      icon: Icons.bookmark_add_outlined,
                      onPress: onPressAddBookMark,
                    ),
            IconButtonWidget(
              icon: Icons.more_vert,
              onPress: onPressedMore,
            ),
          ],
        )
      ],
    );
  }
}
