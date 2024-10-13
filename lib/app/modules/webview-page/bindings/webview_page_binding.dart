import 'package:get/get.dart';

import '../controllers/webview_page_controller.dart';

class WebviewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewPageController>(
      () => WebviewPageController(),
    );
  }
}
