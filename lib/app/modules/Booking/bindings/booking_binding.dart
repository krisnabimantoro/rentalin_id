import 'package:get/get.dart';

import '../controllers/booking_controllers.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingControllers>(
      () => BookingControllers(),
    );
  }
}