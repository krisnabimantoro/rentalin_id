import 'package:get/get.dart';

import '../controllers/manage_motorcycle_controller.dart';

class ManageMotorcycleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageMotorcycleController>(
      () => ManageMotorcycleController(),
    );
  }
}
