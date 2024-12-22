import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/home/views/home_view.dart';
import 'package:rentalin_id/app/modules/login/views/login_view.dart';
import 'package:rentalin_id/app/modules/notification/views/notification_view.dart';
// import 'package:rentalin_id/app/modules/search/controllers/search_controller.dart';
import 'package:rentalin_id/app/modules/search/views/search_view.dart';
import 'package:rentalin_id/app/modules/signup/models/users.dart';
// import 'package:rentalin_id/app/modules/home/views/home_view.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_user_view.dart';
import 'package:rentalin_id/app/widgets/google_button.components.dart';

import '../controllers/signup_controller.dart';
import '../../../widgets/input_text.components.dart';
// import 'package:rentalin_id/app/modules/signup/controllers/signup_controller.dart';

class SignupPasswordView extends GetView<SignupController> {
  const SignupPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: tdBg,
          leading: IconButton(
              onPressed: () {
                Get.to(const SignupUserView());
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Image.asset("assets/icon/arrow-left.png"),
              )),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 23, right: 23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  const Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: tdBlue),
                    ),
                  ),
                  /*3*/
                  const Text(
                    "Welcome to rentalin.id",
                    style: TextStyle(color: tdGrey, fontSize: 16),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 190),
                      child: InputText(
                        labelText: "Password",
                        hintText: "Enter tour password",
                        iconPath: "assets/icon/lock.png",
                        controllerSignup: controller.passwordController,
                        onChanged: (value) =>
                            controller.users.value.password = value,
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: InputText(
                          labelText: "Confirm Password",
                          hintText: "Enter your confirm password",
                          iconPath: "assets/icon/lock.png")),
                  const Padding(
                      padding: EdgeInsets.only(top: 50), child: ButtonNext()),
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonGoogle(
                        iconPath: "assets/icon/google.png",
                        labelText: "Sign in with Google",
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class ButtonNext extends GetView<SignupController> {
  const ButtonNext({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final Users users = controller.users.value;

    Get.lazyPut(() => SignupController());
    return SizedBox(
        width: 380,
        height: 52,
        child: ElevatedButton(
          onPressed: () async {
            CollectionReference addUser = firestore.collection("users");
            await addUser.add({
              'email_address': users.emailAddress,
              'file_name': users.fileName,
              'full_name': users.fullName,
              'name_rent': users.nameRent,
              'phone_number': users.phoneNumber,
              'password': users.password
            });
            await controller.registerUser(
                email: users.emailAddress, password: users.password);

            Get.to(const LoginView());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: tdBlue,
              foregroundColor: tdWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            "Create Account",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
