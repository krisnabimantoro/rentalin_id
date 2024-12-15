import 'package:rentalin_id/app/modules/manage-motorcycle/bindings/manage_motorcycle_binding.dart';

class DenpendencyInjection {
  static void init() {
    ManageMotorcycleBinding().dependencies();
  }
}
