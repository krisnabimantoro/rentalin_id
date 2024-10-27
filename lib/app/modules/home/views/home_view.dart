import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/notification/views/notification_view.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';
import 'package:rentalin_id/app/widgets/cardList.component.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          // leadingWidth: 344,
          elevation: 0,
          backgroundColor: tdBg,
          toolbarHeight: 80,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.centerLeft,
              width: 344,
              height: 56,
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                  color: tdBlue,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                        onPressed: () {
                          Get.to(const NotificationView());
                        },
                        icon: Image.asset("assets/icon/bell.png")),
                  ),
                  const Text(
                    "Rent Motorcycle WUZZ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: tdWhite),
                  ),
                  Container(
                    width: 56,
                    height: 27,
                    decoration: const BoxDecoration(
                        color: tdWhite,
                        image: DecorationImage(
                            image: AssetImage("assets/icon/search1.png")),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          )),
      body: BottomBar(
          body: (BuildContext context, ScrollController controller) {
            return SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    statusCard('Available', '20'),
                    statusCard('Booked', '8'),
                    statusCard('On Rent', '4'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 343,
                  // height: 76,
                  padding: const EdgeInsets.fromLTRB(12, 9, 20, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Number of Motorcycle",
                        style: TextStyle(
                          color: tdBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "20",
                        style: TextStyle(
                          color: tdBlue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24,top: 12),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recommendation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )),
                ),
                const CardRecommendation(),
                const Padding(
                  padding: EdgeInsets.only(left: 24,top: 12),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Avaiable",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )),
                ),
                const CardListMotor(),
                const CardListMotor(),
                SizedBox(height: 120,)
              ]),
            );
          },
          width: 343,
          barColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: const ChildBottomBar()),
    );
  }
}

class CardRecommendation extends StatelessWidget {
  const CardRecommendation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 24),
        width: 156,
        height: 200,
        child: Column(
          children: [
            Container(
                width: 155,
                height: 155,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/img1.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PCX 2024",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Text(
                      "Rp 150.000/Day",
                      style: TextStyle(
                          color: tdBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Honda",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    Text(
                      "Matic",
                      style: TextStyle(
                          color: tdGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget statusCard(String title, String value) {
  return Container(
    // width: 344,
    padding: const EdgeInsets.fromLTRB(12, 9, 20, 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: tdBlue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          value,
          style: const TextStyle(
            color: tdBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
