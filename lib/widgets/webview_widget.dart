import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  final String url;

  const WebviewWidget({super.key, required this.url});

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  final WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();

    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.prevent;
        },
      ),
    );
    controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
