import 'dart:developer';

import 'package:fiveminslearn/graphql/queries.dart';
import 'package:fiveminslearn/screens/blog/blog_list.dart';
import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';
import 'package:fiveminslearn/utils/ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BlogListContainer extends StatefulWidget {
  const BlogListContainer({super.key});

  @override
  State<BlogListContainer> createState() => _BlogListContainerState();
}

class _BlogListContainerState extends State<BlogListContainer> {
  int cursor = 0;
  int limit = 10;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getBlogs),
        variables: {
          "pagination": {
            "cursor": cursor,
            "limit": limit,
          }
        },
        onComplete: (data) {
          setState(() {
            cursor = data['get_blogs']?['cursor'];
          });
        },
        onError: (error) {
          log("get blogs error", error: error!.graphqlErrors[0].message);

          showNotify(
            title: "",
            message: error.graphqlErrors[0].message,
            type: TypeAlert.error,
          );
        },
      ),
      builder: ((QueryResult result, {fetchMore, refetch}) {
        List<GetBlogsWithPaginationApi> blogs = [];

        result.data?['get_blogs']?['items'].forEach((dynamic blog) {
          int id = int.parse(blog?['id']!);
          String? image = blog?['image'];
          String? title = blog?['title'];
          String? description = blog?['description'];
          String? url = blog?['url'];
          bool? isBookMarked = blog?['isBookmarked'];
          String? createdAt = blog?['createdAt'];

          blogs.add(
            GetBlogsWithPaginationApi(
              id: id,
              image: image,
              title: title,
              description: description,
              url: url,
              isBookMarked: isBookMarked,
              createdAt: createdAt,
            ),
          );
        });

        return BlogList(blogs: blogs);
      }),
    );
  }
}
