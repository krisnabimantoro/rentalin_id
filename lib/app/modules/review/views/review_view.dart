import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/home/views/home_view.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({super.key});
  @override
  Widget build(BuildContext context) {
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
              nameMenu: 'Review Motorcycle',
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 128,
                  height: 128,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/img1.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                SizedBox(
                  height: 16,
                  width: 16,
                ),
                Container(
                  width: 200,
                  height: 128,
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: tdWhite,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Column(
                    // mainAxisAlignment: MainAxisAlignment.start,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Honda",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "PCX 2024",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "KH 1231 WG",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Type Matic",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Rp 150.000",
                            style: TextStyle(
                                color: tdBlue, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "/Day",
                            style: TextStyle(color: tdGrey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  SizedBox(
                      width: 70,
                      height: 70,
                      child: IconButton(
                          onPressed: () {Get.to(HomeView());},
                          icon: Image.asset("assets/icon/star-notfill.png"))),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 343),
              child:
                  ButtonMainComponents(buttonName: "Finished", nextPage: () {}),
            )
          ],
        ));
  }
}
