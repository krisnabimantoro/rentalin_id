import 'package:get/get.dart';

import '../controllers/history_page_controller.dart';

class HistoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryPageController>(
      () => HistoryPageController(),
    );
  }
}
