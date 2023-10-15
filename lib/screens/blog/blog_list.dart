import 'package:fiveminslearn/fragments/blog/blog_list_fragment.dart';
import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';

import 'package:flutter/material.dart';

class BlogList extends StatefulWidget {
  final List<GetBlogsWithPaginationApi?> blogs;

  const BlogList({super.key, required this.blogs});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: BlogListFragment(
        blogs: widget.blogs,
      ),
    );
  }
}
