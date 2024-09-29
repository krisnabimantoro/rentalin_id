import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

//   var selectedImagePath = "".obs;
//   var selectedImageSize = "".obs;

//   void getImage(ImageSource imageSource) async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       selectedImagePath.value = pickedFile.path;
//       selectedImageSize.value =
//           "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}MB";
//     } else {
//       Get.snackbar('Error', 'Image Not Selected');
//     }
//   }
//   Future<XFile?> pickImage() async {
//   final imagePicker = ImagePicker();
//   final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     // Process the picked image (display, upload, etc.)
//   }
//   return pickedFile;
// }

  var selectedImagePath = ''.obs; // Observable for image path
  var selectedImageSize = ''.obs; // Observable for image size

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path; 
      final imageFile = File(pickedFile.path);
      final size = await imageFile.length(); 
      selectedImageSize.value =
          '${(size / 1024).toStringAsFixed(2)} KB'; 
    }
    return pickedFile;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
