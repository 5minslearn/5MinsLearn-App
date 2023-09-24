import 'package:fiveminslearn/fragments/blog/blog_list_fragment.dart';
import 'package:fiveminslearn/widgets/blog/blog_card_widget.dart';

import 'package:flutter/material.dart';

final List<BlogItem> blogs = [
  BlogItem(
      id: 1,
      url: "https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/",
      isBookMarked: false,
      image: "lib/assets/images/blog1.png",
      title: "How to Build and Release a Flutter App in Google Play",
      description:
          "In the rapidly evolving world of mobile app development, Flutter has gained immense popularity for its ability to create stunning and high-performance apps across multiple platforms.",
      publishedAt: "24 Sep, 2023",
      author: Author(
        name: "Arunachalam B",
        profilePic: "lib/assets/images/author1.jpg",
      )),
  BlogItem(
    id: 2,
    url: "https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/",
    isBookMarked: true,
    image: "lib/assets/images/blog1.png",
    title: "How to Build and Release a Flutter App in Google Play",
    description:
        "In the rapidly evolving world of mobile app development, Flutter has gained immense popularity for its ability to create stunning and high-performance apps across multiple platforms.",
    publishedAt: "24 Sep, 2023",
    author: Author(
      name: "Arunachalam B",
      profilePic: "lib/assets/images/author1.jpg",
    ),
  ),
  BlogItem(
    id: 3,
    url: "https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/",
    isBookMarked: false,
    image: "lib/assets/images/blog1.png",
    title: "How to Build and Release a Flutter App in Google Play",
    description:
        "In the rapidly evolving world of mobile app development, Flutter has gained immense popularity for its ability to create stunning and high-performance apps across multiple platforms.",
    publishedAt: "24 Sep, 2023",
    author: Author(
      name: "Arunachalam B",
      profilePic: "lib/assets/images/author1.jpg",
    ),
  ),
  BlogItem(
    id: 4,
    url: "https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/",
    isBookMarked: true,
    image: "lib/assets/images/blog1.png",
    title: "How to Build and Release a Flutter App in Google Play",
    description:
        "In the rapidly evolving world of mobile app development, Flutter has gained immense popularity for its ability to create stunning and high-performance apps across multiple platforms.",
    publishedAt: "24 Sep, 2023",
    author: Author(
      name: "Arunachalam B",
      profilePic: "lib/assets/images/author1.jpg",
    ),
  ),
  BlogItem(
    id: 5,
    url: "https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/",
    isBookMarked: false,
    image: "lib/assets/images/blog1.png",
    title: "How to Build and Release a Flutter App in Google Play",
    description:
        "In the rapidly evolving world of mobile app development, Flutter has gained immense popularity for its ability to create stunning and high-performance apps across multiple platforms.",
    publishedAt: "24 Sep, 2023",
    author: Author(
      name: "Arunachalam B",
      profilePic: "lib/assets/images/author1.jpg",
    ),
  ),
  BlogItem(
    id: 6,
    url: "https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/",
    isBookMarked: true,
    image: "lib/assets/images/blog1.png",
    title: "How to Build and Release a Flutter App in Google Play",
    description:
        "In the rapidly evolving world of mobile app development, Flutter has gained immense popularity for its ability to create stunning and high-performance apps across multiple platforms.",
    publishedAt: "24 Sep, 2023",
    author: Author(
      name: "Arunachalam B",
      profilePic: "lib/assets/images/author1.jpg",
    ),
  ),
];

class BlogList extends StatefulWidget {
  const BlogList({super.key});

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
        blogs: blogs,
      ),
    );
  }
}
