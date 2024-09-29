import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/widgets/google_button.dart';

import '../controllers/signup_controller.dart';
import '../../widgets/input_text.dart';
// import 'package:rentalin_id/app/modules/signup/controllers/signup_controller.dart';

class SignupUserView extends GetView<SignupController> {
  const SignupUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Image.asset("assets/icon/arrow-left.png"),
              )),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 23, right: 23),
          child: const Column(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Padding(
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
                  Text(
                    "Welcome to rentalin.id",
                    style: TextStyle(color: tdGrey, fontSize: 16),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: InputText(
                          labelText: "Full Name",
                          hintText: "Enter tour Full Name",
                          iconPath: "assets/icon/user.png")), Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: InputText(
                          labelText: "Email Address",
                          hintText: "Enter tour email address",
                          iconPath: "assets/icon/mail.png")), Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: InputText(
                          labelText: "Phone Number",
                          hintText: "Enter tour phone number",
                          iconPath: "assets/icon/phone.png")),
                  Padding(
                      padding: EdgeInsets.only(top: 40), child: ButtonNext()),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonGoogle(
                          iconPath: "assets/icon/google.png",
                          labelText: "Sign in with Google")),
                  Padding(
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
              )),
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
          onPressed: () {},
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
