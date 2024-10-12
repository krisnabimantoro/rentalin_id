import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/Rent/views/rent_view.dart';
import 'package:rentalin_id/app/modules/Rent/views/rent4_view.dart';

import '../../../widgets/app_bar.components.dart';
import '../../rent/views/rentDetail_view.dart';
import '../controllers/booking_controllers.dart';

class BookingView extends GetView<BookingControllers>{
  const BookingView({super.key});

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
        title: const AppBarComponents(nameMenu: 'Detail Booking',),
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
            BtnRent2(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnDelBook(),
                SizedBox(width: 10,),
                BtnUpBook(),
              ],
            )
          ],
        ),
      )
     
    );
  }
}

class BtnRent2 extends StatelessWidget {
  const BtnRent2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const RentDetail());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff34C759),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Rent Now",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnDelBook extends StatelessWidget {
  const BtnDelBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(Rent4View());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdWhite,
          foregroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Delete Book",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnUpBook extends StatelessWidget {
  const BtnUpBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(Rent4View());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFF9500),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Update Book",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}