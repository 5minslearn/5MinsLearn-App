import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';
import 'package:fiveminslearn/widgets/blog/blog_card_widget.dart';

import 'package:flutter/material.dart';

class BlogListFragment extends StatelessWidget {
  final List<GetBlogsWithPaginationApi?>? blogs;
  final void Function(int blogId) onPressAddBookmark;
  final void Function(int blogId) onPressRemoveBookmark;
  final bool? isBookmarkLoading;

  const BlogListFragment({
    super.key,
    required this.onPressAddBookmark,
    required this.onPressRemoveBookmark,
    this.blogs,
    this.isBookmarkLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: blogs!.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (BuildContext contenxt, int index) => const SizedBox(height: 5),
      itemBuilder: (BuildContext context, int index) => BlogCardWidget(
        blog: blogs![index],
        onPressAddBookmark: onPressAddBookmark,
        onPressRemoveBookmark: onPressRemoveBookmark,
        isBookmarkLoading: isBookmarkLoading,
      ),
    );
  }
}
