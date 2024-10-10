import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_password_view.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_view.dart';
import 'package:rentalin_id/app/modules/widgets/google_button.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/signup_controller.dart';
import '../../widgets/input_text.dart';

class SignupUserView extends GetView<SignupController> {
  const SignupUserView({super.key});

  Widget displayImage(XFile? pickedFile) {
    if (pickedFile != null) {
      return Image.file(File(pickedFile.path));
    } else {
      return const Text('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBg,
        leading: IconButton(
          onPressed: () {
            Get.to(SignupView());
          },
          icon: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Image.asset("assets/icon/arrow-left.png"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          // Set mainAxisSize to min to allow scrolling properly
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                "Create Your Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: tdBlue,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Welcome to rentalin.id",
                style: TextStyle(color: tdGrey, fontSize: 16),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile Picture",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: tdBlue,
                  ),
                ),
                SizedBox(
                  width: 380,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await controller
                          .pickImage(); // Call the pickImage method
                      if (pickedFile != null) {
                        controller.selectedImagePath.value =
                            pickedFile.path; // Update the path in controller
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdWhite,
                      foregroundColor: tdWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: tdBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Obx(() {
                      return controller.selectedImagePath.value.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(controller.selectedImagePath.value),

                                fit: BoxFit.cover, // Adjust the fit as needed
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icon/image-plus.png",
                                width: 100,
                                height: 100,
                              ),
                            );
                    }),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputText(
                labelText: "Full Name",
                hintText: "Enter your Full Name",
                iconPath: "assets/icon/user.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputText(
                labelText: "Email Address",
                hintText: "Enter your email address",
                iconPath: "assets/icon/mail.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputText(
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                iconPath: "assets/icon/phone.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: ButtonNext(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ButtonGoogle(
                iconPath: "assets/icon/google.png",
                labelText: "Sign in with Google",
                onPressed: () {
                  print("button pressed");
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Have an Account?",
                      style: TextStyle(color: tdGrey),
                    ),
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const SignupPasswordView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdBlue,
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
