import 'package:fiveminslearn/widgets/webview_widget.dart';
import 'package:flutter/material.dart';

class BlogViewFragment extends StatelessWidget {
  final String url;

  const BlogViewFragment({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewWidget(url: url),
    );
  }
}
