import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/Rent/controllers/rent_controller.dart';

import '../../../data/constant/color.dart';
import '../../../widgets/app_bar.components.dart';
import '../../../widgets/input_text.components.dart';
import 'rent_view.dart';
import 'rent2_view.dart';
import 'rent4_view.dart';

class Rent3View extends GetView<RentController>{
  const Rent3View({super.key});

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
        title: const AppBarComponents(nameMenu: 'Rent Motorcycle',),
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
            Info3(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnBk2(),
                SizedBox(width: 18),
                BtnN3(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Info3 extends StatelessWidget {
  const Info3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(13, 21, 14, 21),
      width: 344,
      height: 400  ,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InputText(
            labelText: 'Deliver Address', 
            hintText: 'Enter your Delivery Address', 
            iconPath: "assets/icon/lock.png",
          ),
          SizedBox(height: 10,),
          InputText(
            labelText: 'Pickup Address', 
            hintText: 'Enter your Pickup Address', 
            iconPath: "assets/icon/lock.png",
          ),
          SizedBox(height: 10,),
          InputText(
            labelText: 'Method Payment', 
            hintText: 'Select your method payment', 
            iconPath: "assets/icon/lock.png",
          ),
          SizedBox(height: 10,),
          InputText(
            labelText: 'Total Payment', 
            hintText: 'Rp.300.000', 
            iconPath: "assets/icon/lock.png",
          ),
        ],
      ),
    );
  }
}

class BtnBk2 extends StatelessWidget {
  const BtnBk2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const Rent2View());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdWhite,
          foregroundColor: tdBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Go Back",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnN3 extends StatelessWidget {
  const BtnN3({super.key});

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