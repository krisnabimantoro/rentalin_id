import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/webview_page_controller.dart';

class WebviewPageView extends GetView<WebviewPageController> {
  const WebviewPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebviewPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WebviewPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
