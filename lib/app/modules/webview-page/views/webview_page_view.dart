import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/webview_page_controller.dart';

class WebviewPageView extends GetView<WebviewPageController> {
  const WebviewPageView({super.key});
  @override
  Widget build(BuildContext context) {
       Get.put(WebviewPageController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('WebviewPageView'),
          centerTitle: true,
        ),
        body: WebViewWidget(
          controller: controller.webViewController(
              "https://chibirentalmotormalang.com/"),
        ));
  }
}
