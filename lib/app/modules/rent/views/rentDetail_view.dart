import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/review/views/review_view.dart';

import '../../../data/constant/color.dart';
import '../../../widgets/app_bar.components.dart';
import '../controllers/rent_controller.dart';
import 'rent4_view.dart';
import 'rentHistory_view.dart';
import 'rent_view.dart';

class RentDetail extends GetView<RentController>{
  const RentDetail({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: tdBg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 100,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(nameMenu: 'Detail Rent',),
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                motorP(),
                motorI(),
              ],
            ),
            detRent(),
            SizedBox(height: 10,),
            BtnFinish(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnDelRent(),
                SizedBox(width: 10,),
                BtnUpRent(),
              ],
            ),
            SizedBox(height: 20,)
          ],
        ),
      )
     
    );
  }
}

class BtnFinish extends StatelessWidget {
  const BtnFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Get.to(ReviewView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdBlue,
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Finish Rent",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnDelRent extends StatelessWidget {
  const BtnDelRent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const Renthistory());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdWhite,
          foregroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Delete Rent",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnUpRent extends StatelessWidget {
  const BtnUpRent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(RentView());
          // Get.to(RentDetail());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFF9500),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Update Rent",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );;
  }
}