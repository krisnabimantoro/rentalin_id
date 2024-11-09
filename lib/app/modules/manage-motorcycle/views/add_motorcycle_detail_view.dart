import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

import '../controllers/add_motorcyle_controller.dart';
import '../models/motorcycle.dart';

class AddMotorcycleDetailView extends GetView<AddMotorcycleController> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddMotorcycleController());
    final Motorcycle motorcycle = Get.arguments;

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
            nameMenu: 'Add New Motorcycle',
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 344,
              height: 148,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/img1.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: tdGrey),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              width: 345,
              height: 217,
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail Motor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("Merk Motor"),
                      Text("Motor Name"),
                      Text("Type Motor"),
                      Text("Plat Motor"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "",
                      ),
                      Text(motorcycle.merkMotor??''),
                      Text(motorcycle.motorName??''),
                      Text(motorcycle.typeMotor??''),
                      Text(motorcycle.platMotor??''),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.motorcycle.value.isRecommended,
                      onChanged: (value) {
                        // Update the controller's value when the checkbox is toggled
                        controller.motorcycle.value.isRecommended =
                            value ?? false;
                      },
                    ),
                  ),
                  const Text('Recommended'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                  labelText: "Price/Day",
                  hintText: "Rp. 150.000",
                  onChanged: (value) {
                    double? price = double.tryParse(value);
                    if (price != null) {
                      controller.motorcycle.value.pricePerDay = price;
                    }
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Align buttons evenly
              children: [
                // "Go Back" button with fixed size
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      // Define what happens when "Go Back" is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: tdBlue,
                      backgroundColor: Colors.white, // Text color
                      side: BorderSide(color: tdBlue), // Border color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // "Add New" button with fixed size
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      CollectionReference addMotor =
                          firestore.collection("Manage MotorCycle");
                      await addMotor.add({
                        'Merk Motor': motorcycle.merkMotor,
                        'Motor Name': motorcycle.motorName,
                        'Plat Motor': motorcycle.platMotor,
                        'Price/Day': motorcycle.pricePerDay,
                        'Recommendation': motorcycle.isRecommended,
                        'Type Motor': motorcycle.typeMotor
                      });
                      // Define what happens when "Add New" is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: tdgreen, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Add New',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    // TODO: implement build
  }
}
