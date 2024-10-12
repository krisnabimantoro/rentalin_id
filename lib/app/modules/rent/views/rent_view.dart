import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/Rent/views/rent2_view.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_password_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/input_text.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

import '../controllers/rent_controller.dart';

class RentView extends GetView<RentController> {
  const RentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 100,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(
          nameMenu: 'Rent Motorcycle',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                motorP(),
                motorI(),
              ],
            ),
            Info1(),
            BtnN(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class motorP extends StatelessWidget {
  const motorP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 128,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage("assets/img/img1.jpg"),
            fit: BoxFit.fill,
          )),
    );
  }
}

class motorI extends StatelessWidget {
  const motorI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.all(10),
      height: 128,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Honda',
            style: TextStyle(fontSize: 13),
          ),
          Text(
            'PCX 2024',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text('KH 1231 WG'),
          Text(
            'Type Matic',
            style: TextStyle(fontSize: 10),
          ),
          Text(''),
          Text(
            'Rp 150.000/Day',
            style: TextStyle(color: tdBlue),
          ),
        ],
      ),
    );
  }
}

class Info1 extends StatelessWidget {
  const Info1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(13, 21, 14, 21),
      width: 344,
      height: 480,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          InputTextNoIcon(
            labelText: 'Full Name', 
            hintText: 'Enter your full name'
          ),
          SizedBox(
            height: 10,
          ),
          InputTextNoIcon(
            labelText: 'Hometown', 
            hintText: 'Enter your city of origin'
          ),
          SizedBox(
            height: 10,
          ),
          InputTextNoIcon(
            labelText: 'No Handphone 1', 
            hintText: 'Enter your No Handphone 1'
          ),
          SizedBox(
            height: 10,
          ),
          InputTextNoIcon(
            labelText: 'No Handphone 2', 
            hintText: 'Enter your No Handphone 2'
          ),
          SizedBox(
            height: 10,
          ),
          InputTextNoIcon(
            labelText: 'Helm', 
            hintText: 'Enter your helm'
          ),
        ],
      ),
    );
  }
}

class BtnN extends StatelessWidget {
  const BtnN({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const Rent2View());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdBlue,
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
