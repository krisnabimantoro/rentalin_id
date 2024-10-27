import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/home/views/home_view.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_view.dart';
import 'package:rentalin_id/app/routes/app_pages.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/google_button.components.dart';
import 'package:rentalin_id/app/widgets/input_text.components.dart';

import '../controllers/login_controller.dart';



class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: tdBg,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Padding(
        //       padding: const EdgeInsets.only(left: 6),
        //       child: Image.asset("assets/icon/arrow-left.png"),
        //     )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /*2*/
              const Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  "Hi, Welcome Back! ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, color: tdBlue),
                ),
              ),
              /*3*/
              const Text(
                "Sign In First",
                style: TextStyle(color: tdGrey, fontSize: 16),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 140),
                  child: InputText(
                      labelText: "Email Address",
                      hintText: "Enter your email address",
                      iconPath: "assets/icon/mail.png")),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: InputText(
                      labelText: "Password",
                      hintText: "Enter your password",
                      iconPath: "assets/icon/lock.png")),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text(
                      'Remember Me',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(fontWeight: FontWeight.bold, color: tdBlue),
                )
              ]),
              Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ButtonMainComponents(
                      buttonName: "Login",
                      nextPage: () {
                        Get.offAndToNamed(Routes.HOME);
                      }))
            ]),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonGoogle(
                  iconPath: "assets/icon/google.png",
                  labelText: "Sign in with Google",
                  
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Don’t Have Account?",
                      style: TextStyle(color: tdGrey),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignupView());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ], //children
        ),
      ),
    );
  }
}
