import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/profile/views/profile_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

class EditprofileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          // surfaceTintColor: tdGrey,
          scrolledUnderElevation: 0,
          // leadingWidth: 344,
          elevation: 0,
          backgroundColor: tdBg,
          toolbarHeight: 80,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: const AppBarComponents(
            nameMenu: 'Edit Profile',
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ViewProfile(),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: 347,
                    decoration: const BoxDecoration(
                        color: tdWhite,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputTextNoIcon(
                            labelText: "Full Name",
                            hintText: "Input your Full Name"),
                        SizedBox(
                          height: 10,
                        ),
                        InputTextNoIcon(
                            labelText: "Email Address",
                            hintText: "Input your Email Address"),
                        SizedBox(
                          height: 10,
                        ),
                        InputTextNoIcon(
                            labelText: "Phone Number",
                            hintText: "Input your Phone Number"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: 347,
                    decoration: const BoxDecoration(
                        color: tdWhite,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputTextNoIcon(
                            labelText: "Password",
                            hintText: "Input your Password"),
                        SizedBox(
                          height: 10,
                        ),
                        InputTextNoIcon(
                            labelText: "Confirm Password",
                            hintText: "Confirm Password")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonMainComponents(
                buttonName: "Save",
                nextPage: () {
                  Get.to(const ProfileView());
                })
          ],
        ),
      ),
    );
  }
}
