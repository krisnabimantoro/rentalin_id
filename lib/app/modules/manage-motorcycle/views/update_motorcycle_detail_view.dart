import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/add_motorcyle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/read_motorcycle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/manage_motorcycle_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/input_text.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

class UpdateMotorcycleDetailView extends GetView<AddMotorcycleController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddMotorcycleController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final Motorcycle motorcycle = Get.arguments;
    final AudioPlayer audioPlayer = AudioPlayer();
    Future<void> playNotificationSound() async {
      await audioPlayer.play(AssetSource('audio/notification.mp3'));
    }

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
            nameMenu: 'Update Motorcycle',
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
                  Column(
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
                      Text(
                        "",
                      ),
                      Text(motorcycle.merkMotor.toString()),
                      Text(motorcycle.motorName.toString()),
                      Text(motorcycle.typeMotor.toString()),
                      Text(motorcycle.platMotor.toString()),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Is Recommendation",
                hintText: "${motorcycle.isRecommended}",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                  labelText: "Price/Day",
                  hintText: motorcycle.pricePerDay.toString(),
                  onChanged: (value) => controller
                      .motorcycle.value.pricePerDay = value as double?),
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
                      await playNotificationSound();
                      await firestore
                          .collection('Manage MotorCycle')
                          .doc(motorcycle.motorcycleId)
                          .update({
                        'Merk Motor': motorcycle.merkMotor,
                        'Motor Name': motorcycle.motorName,
                        'Plat Motor': motorcycle.platMotor,
                        'Price Day': motorcycle.pricePerDay,
                        'Recommendation': motorcycle.isRecommended,
                        'Type Motor': motorcycle.typeMotor
                      });
                      Get.off(ManageMotorcycleView());
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
                      'Save',
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
