import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
// import 'package:rentalin_id/app/modules/home/views/home_view.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_user_view.dart';
import 'package:rentalin_id/app/widgets/google_button.components.dart';

import '../controllers/signup_controller.dart';
import '../../../widgets/input_text.components.dart';
// import 'package:rentalin_id/app/modules/signup/controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: tdBg,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                  const Padding(
                      padding: EdgeInsets.only(top: 190),
                      child: InputText(
                          labelText: "Name Rent",
                          hintText: "Enter tour name rent",
                          iconPath: "assets/icon/building.png")),
                  const Padding(
                      padding: EdgeInsets.only(top: 170), child: ButtonNext()),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ButtonGoogle(
                        iconPath: "assets/icon/google.png",
                        labelText: "Sign in with Google",
                        onPressed: () {
                          print("Button pressed!");
                        },
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
                        ),
                      ],
                    ),
                  )
                ], //children
              ),
            ],
          ),
        ));
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
            Get.to(const SignupUserView());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: tdBlue,
              foregroundColor: tdWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
