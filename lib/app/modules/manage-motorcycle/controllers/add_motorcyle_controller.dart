import 'package:get/get.dart';
import '../models/motorcycle.dart';

class AddMotorcycleController extends GetxController {
  var motorcycle = Motorcycle(
    merkMotor: '',
    motorName: '',
    typeMotor: '',
    platMotor: '',
    pricePerDay: 0.0,
    isRecommended: false,
  ).obs;

  // void clearInputs() {
  //   motorcycle.value =
  //       Motorcycle(merkMotor: '', motorName: '', typeMotor: '', platMotor: '');
  // }
}
