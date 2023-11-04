import 'dart:developer';

import 'package:fiveminslearn/fragments/blog/blog_list_fragment.dart';
import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BlogList extends StatefulWidget {
  final List<GetBlogsWithPaginationApi?> blogs;
  final void Function(int blogId) onPressAddBookmark;
  final void Function(int blogId) onPressRemoveBookmark;
  final Future<QueryResult<Object?>> Function(FetchMoreOptions)? loadMore;
  final bool? isBookmarkLoading;
  final int? nextCursor;
  final bool isLoading;

  const BlogList({
    super.key,
    required this.blogs,
    required this.onPressAddBookmark,
    required this.onPressRemoveBookmark,
    required this.loadMore,
    required this.isLoading,
    this.isBookmarkLoading,
    this.nextCursor,
  });

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  void loadMore() {
    log("load more calling....", level: 2000);
    if (widget.nextCursor! != -1 && !widget.isLoading) {
      widget.loadMore!(
        FetchMoreOptions(
          variables: {
            "pagination": {
              "cursor": widget.nextCursor,
              "limit": 10,
            },
          },
          updateQuery: ((previousResultData, fetchMoreResultData) {
            final List<dynamic> finalResult = [
              ...previousResultData!['get_blogs']['items'] as List<dynamic>,
              ...fetchMoreResultData!['get_blogs']['items'] as List<dynamic>
            ];

            fetchMoreResultData['get_blogs']['items'] = finalResult;

            return fetchMoreResultData;
          }),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: BlogListFragment(
        blogs: widget.blogs,
        onPressAddBookmark: widget.onPressAddBookmark,
        onPressRemoveBookmark: widget.onPressRemoveBookmark,
        isBookmarkLoading: widget.isBookmarkLoading,
        loadMore: loadMore,
      ),
    );
  }
}
