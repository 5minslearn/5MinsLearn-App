import 'package:fiveminslearn/fragments/blog_view_fragment.dart';
import 'package:fiveminslearn/types/apis/get_blogs_with_pagination_api.dart';
import 'package:fiveminslearn/widgets/blog/blog_action_widget.dart';
import 'package:fiveminslearn/widgets/card_widget.dart';
import 'package:fiveminslearn/widgets/divider_widget.dart';
import 'package:fiveminslearn/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Author {
  String? name;
  String? profilePic;

  Author({this.name, this.profilePic});
}

class BlogItem {
  int id;
  String? image;
  String? title;
  String? description;
  String? url;
  bool? isBookMarked;
  String? publishedAt;
  Author? author;

  BlogItem({
    required this.id,
    this.image,
    this.title,
    this.description,
    this.url,
    this.isBookMarked,
    this.publishedAt,
    this.author,
  });
}

Type blogItem = BlogItem;

class BlogCardWidget extends StatelessWidget {
  final GetBlogsWithPaginationApi? blog;
  final void Function(int blogId) onPressAddBookmark;
  final void Function(int blogId) onPressRemoveBookmark;
  final bool? isBookmarkLoading;

  const BlogCardWidget({
    super.key,
    required this.onPressAddBookmark,
    required this.onPressRemoveBookmark,
    this.blog,
    this.isBookmarkLoading,
  });

  void onPress(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BlogViewFragment(url: blog!.url!)));
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        onPress: onPress,
        child: blog != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8, top: 20),
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children: [
                    // if (blog!.author != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Wrap(
                        //   spacing: 10,
                        //   alignment: WrapAlignment.start,
                        //   crossAxisAlignment: WrapCrossAlignment.center,
                        //   children: [
                        //     if (blog!.author!.profilePic != null)
                        //       CircleAvatar(
                        //         radius: 18,
                        //         backgroundImage: AssetImage(
                        //           blog!.author!.profilePic!,
                        //         ),
                        //       ),
                        //     if (blog!.author!.name != null)
                        //       TextWidget(
                        //         text: blog!.author!.name!,
                        //         variant: TextVariant.label,
                        //       ),
                        //   ],
                        // ),
                        if (blog!.createdAt != null)
                          TextWidget(
                            text: DateFormat.yMMMEd().format(DateTime.parse(blog!.createdAt!)),
                            variant: TextVariant.helper,
                          )
                      ],
                    ),
                    if (blog!.image != null)
                      Image.network(
                        blog!.image!,
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        errorBuilder: ((context, error, stackTrace) {
                          return const SizedBox();
                        }),
                      ),
                    Wrap(
                      runSpacing: 5,
                      children: [
                        if (blog!.title != null)
                          TextWidget(
                            text: blog!.title!,
                            variant: TextVariant.title,
                            maxLines: 2,
                          ),
                        if (blog!.description != null)
                          TextWidget(
                            text: blog!.description!,
                            variant: TextVariant.text,
                            maxLines: 3,
                          )
                      ],
                    ),
                    Wrap(
                      children: [
                        const DividerWidget(),
                        BlogActionWidget(
                          blogId: blog!.id,
                          isBookMarked: blog!.isBookMarked,
                          onPressAddBookmark: onPressAddBookmark,
                          onPressRemoveBookmark: onPressRemoveBookmark,
                          isBookmarkLoading: isBookmarkLoading,
                        ),
                      ],
                    )
                  ],
                ),
              )
            : const SizedBox());
  }
}
