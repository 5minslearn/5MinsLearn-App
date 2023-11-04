import 'dart:developer';

import 'package:fiveminslearn/constants.dart';
import 'package:fiveminslearn/graphql/mutations.dart';
import 'package:fiveminslearn/graphql/queries.dart';
import 'package:fiveminslearn/screens/blog/blog_list.dart';
import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';
import 'package:fiveminslearn/utils/error_handler.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BlogListContainer extends StatefulHookWidget {
  const BlogListContainer({super.key});

  @override
  State<BlogListContainer> createState() => _BlogListContainerState();
}

class _BlogListContainerState extends State<BlogListContainer> {
  int cursor = 0;
  int nextCursor = 0;
  bool isBookmarkLoading = false;

  void updateBookmarkResult(GraphQLDataProxy cache, {required String blogId, required bool isBookmarked}) {
    Map<String, dynamic>? cacheBlogs = cache.readQuery(
      Request(
        operation: Operation(
          document: gql(getBlogsQueryGql),
        ),
        variables: const {
          "pagination": {
            "cursor": 0,
            "limit": 10,
          },
        },
      ),
    );

    cacheBlogs!['get_blogs']['items'].map(((blog) {
      if (blog['id'] == blogId) {
        blog['isBookmarked'] = isBookmarked;
      }

      return blog;
    })).toList();

    cache.writeQuery(
      Request(
        operation: Operation(
          document: gql(getBlogsQueryGql),
        ),
        variables: const {
          "pagination": {
            "cursor": 0,
            "limit": 10,
          },
        },
      ),
      data: cacheBlogs,
    );
  }

  @override
  Widget build(BuildContext context) {
    final addBookmark = useMutation(MutationOptions(
      document: gql(addBookmarkMutationGql),
      update: (GraphQLDataProxy cache, QueryResult<Object?>? result) {
        if (result?.data != null) {
          updateBookmarkResult(
            cache,
            blogId: result!.data!['add_bookmark']!['blogId']!.toString(),
            isBookmarked: true,
          );
        }
      },
      onCompleted: (dynamic resultData) {
        setState(() {
          isBookmarkLoading = false;
        });

        log("Add bookmark response: $resultData");
      },
      onError: (error) {
        handleGraphqlError(error);
      },
    ));

    final removeBookmark = useMutation(MutationOptions(
      document: gql(removeBookmarkMutationGql),
      update: (GraphQLDataProxy cache, QueryResult<Object?>? result) {
        setState(() {
          isBookmarkLoading = result!.isLoading;
        });

        if (result?.data != null) {
          updateBookmarkResult(
            cache,
            blogId: result!.data!['remove_bookmark']!['blogId']!.toString(),
            isBookmarked: false,
          );
        }
      },
      onCompleted: (dynamic resultData) {
        setState(() {
          isBookmarkLoading = false;
        });

        log("Remove bookmark response:  $resultData");
      },
      onError: ((error) {
        handleGraphqlError(error);
      }),
    ));

    void onPressAddBookmark(int blogId) {
      setState(() {
        isBookmarkLoading = true;
      });

      addBookmark.runMutation(
        {
          "input": {
            "blogId": blogId,
          },
        },
        optimisticResult: {
          {
            "__typename": "Mutation",
            'add_bookmark': {
              "__typename": "BookmarkUpdateResponseType",
              'blogId': blogId.toString(),
              'message': "Bookmark added optimistic result",
            },
          }
        },
      );
    }

    void onPressRemoveBookmark(int blogId) {
      setState(() {
        isBookmarkLoading = true;
      });

      removeBookmark.runMutation(
        {
          "input": {
            "blogId": blogId,
          }
        },
        optimisticResult: {
          {
            "__typename": "Mutation",
            'remove_bookmark': {
              "__typename": "BookmarkUpdateResponseType",
              'blogId': blogId.toString(),
              'message': "Bookmark removed optimistic result",
            },
          },
        },
      );
    }

    return Query(
      options: QueryOptions(
        document: gql(getBlogsQueryGql),
        variables: {
          "pagination": {
            "cursor": cursor,
            "limit": BLOGS_PER_PAGE_LIMIT,
          }
        },
        onComplete: (data) {
          setState(() {
            nextCursor = data['get_blogs']?['cursor'];
          });
        },
        onError: (error) {
          handleGraphqlError(error, shoudShowAlert: true);
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

        return BlogList(
          blogs: blogs,
          onPressAddBookmark: onPressAddBookmark,
          onPressRemoveBookmark: onPressRemoveBookmark,
          isBookmarkLoading: isBookmarkLoading,
          loadMore: fetchMore,
          nextCursor: nextCursor,
          isLoading: result.isLoading,
        );
      }),
    );
  }
}
