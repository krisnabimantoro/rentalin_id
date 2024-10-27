import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rentalin_id/app/routes/app_pages.dart';

import '../data/services/auth.controller.dart';

class ButtonGoogle extends StatefulWidget {
  final String iconPath;
  final String labelText;

  const ButtonGoogle({
    super.key,
    required this.iconPath,
    required this.labelText,
  });

  @override
  State<ButtonGoogle> createState() => _ButtonGoogleState();
}

class _ButtonGoogleState extends State<ButtonGoogle> {
  // ValueNotifier userCredential = ValueNotifier('');
  ValueNotifier<UserCredential?> userCredential =
      ValueNotifier(null); // Use UserCredential type

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        height: 52,
        child: ElevatedButton.icon(
          onPressed: () async {
            userCredential.value = await signInWithGoogle();

            if (userCredential.value != null) {
              Get.offAndToNamed(Routes.HOME);
            } else {
              print('Login failed');
            }
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.iconPath),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: tdWhite,
              foregroundColor: tdGrey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: tdGrey),
                borderRadius: BorderRadius.circular(10),
              )),
          label: Text(
            widget.labelText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
