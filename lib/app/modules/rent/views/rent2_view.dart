import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/rent/views/rent3_view.dart';
import 'package:rentalin_id/app/modules/rent/views/rent_view.dart';


import '../../../widgets/app_bar.components.dart';
import '../../../widgets/input_text.components.dart';
import '../controllers/rent_controller.dart';


class Rent2View extends GetView<RentController>{
  const Rent2View({super.key});
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
            Info2(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnBk(),
                SizedBox(width: 18),
                BtnN2(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Info2 extends StatelessWidget {
  const Info2({super.key});

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
            labelText: 'Date Start Rent', 
            hintText: '09 November 2024', 
            iconPath: "assets/icon/lock.png",
          ),
          SizedBox(height: 10,),
          InputText(
            labelText: 'End Date Rent', 
            hintText: '12 November 2024', 
            iconPath: "assets/icon/lock.png",
          ),
          SizedBox(height: 10,),
          InputText(
            labelText: 'Clock Start Rent', 
            hintText: '12:00', 
            iconPath: "assets/icon/lock.png",
          ),
          SizedBox(height: 10,),
          InputText(
            labelText: 'Clock End Rent', 
            hintText: '17:00', 
            iconPath: "assets/icon/lock.png",
          ),
        ],
      ),
    );
  }
}

class BtnBk extends StatelessWidget {
  const BtnBk({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const RentView());
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

class BtnN2 extends StatelessWidget {
  const BtnN2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const Rent3View());
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