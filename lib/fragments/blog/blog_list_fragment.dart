import 'package:fiveminslearn/widgets/blog/blog_card_widget.dart';

import 'package:flutter/material.dart';

class BlogListFragment extends StatelessWidget {
  final List<BlogItem>? blogs;

  const BlogListFragment({super.key, this.blogs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: blogs!.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (BuildContext contenxt, int index) => const SizedBox(height: 5),
      itemBuilder: (BuildContext context, int index) => BlogCardWidget(
        blog: blogs![index],
      ),
    );
  }
}
