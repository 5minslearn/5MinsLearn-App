import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';
import 'package:fiveminslearn/widgets/blog/blog_card_widget.dart';

import 'package:flutter/material.dart';

class BlogListFragment extends StatelessWidget {
  final List<GetBlogsWithPaginationApi?>? blogs;
  final void Function(int blogId) onPressAddBookmark;
  final void Function(int blogId) onPressRemoveBookmark;
  final bool? isBookmarkLoading;
  final void Function() loadMore;

  const BlogListFragment({
    super.key,
    required this.onPressAddBookmark,
    required this.onPressRemoveBookmark,
    required this.loadMore,
    this.blogs,
    this.isBookmarkLoading,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          loadMore();
        }

        return true;
      },
      child: ListView.separated(
        itemCount: blogs!.length,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext contenxt, int index) => const SizedBox(height: 5),
        itemBuilder: (BuildContext context, int index) => BlogCardWidget(
          blog: blogs![index],
          onPressAddBookmark: onPressAddBookmark,
          onPressRemoveBookmark: onPressRemoveBookmark,
          isBookmarkLoading: isBookmarkLoading,
        ),
      ),
    );
  }
}
