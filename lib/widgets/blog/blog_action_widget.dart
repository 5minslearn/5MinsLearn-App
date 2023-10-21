import 'package:fiveminslearn/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

class BlogActionWidget extends StatelessWidget {
  final int blogId;
  final Function? onPressShare;
  final Function? onPressMore;
  final bool? isBookMarked;
  final void Function(int blogId)? onPressAddBookmark;
  final void Function(int blogId)? onPressRemoveBookmark;
  final bool? isBookmarkLoading;

  const BlogActionWidget({
    super.key,
    required this.blogId,
    this.onPressAddBookmark,
    this.onPressRemoveBookmark,
    this.onPressShare,
    this.onPressMore,
    this.isBookMarked,
    this.isBookmarkLoading,
  });

  void onPressedShare() {
    try {
      onPressShare!();
    } catch (e) {
      //
    }
  }

  void onPressedAddBookmark() {
    try {
      onPressAddBookmark!(blogId);
    } catch (e) {
      //
    }
  }

  void onPressedRemoveBookmark() {
    try {
      onPressRemoveBookmark!(blogId);
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
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconButtonWidget(
              icon: Icons.share,
              onPress: onPressedShare,
            ),
            if (isBookMarked != null)
              isBookMarked!
                  ? IconButtonWidget(
                      icon: Icons.bookmark_remove,
                      onPress: onPressedRemoveBookmark,
                    )
                  : IconButtonWidget(
                      icon: Icons.bookmark_add_outlined,
                      onPress: onPressedAddBookmark,
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
