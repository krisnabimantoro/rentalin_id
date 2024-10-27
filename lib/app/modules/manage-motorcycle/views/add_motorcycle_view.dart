import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/add_motorcyle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/add_motorcycle_detail_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

class AddMotorcycleView extends GetView<AddMotorcycleController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddMotorcycleController());
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Motor Picture",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: tdBlue,
                  ),
                ),
                SizedBox(
                    width: 380,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdWhite,
                        foregroundColor: tdWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: tdBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icon/image-plus.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Merk Motor",
                hintText: "Honda",
                onChanged: (value) =>
                    controller.motorcycle.value.merkMotor = value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Motor Name",
                hintText: "PCX",
                onChanged: (value) =>
                    controller.motorcycle.value.motorName = value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Type Motor",
                hintText: "Matic",
                onChanged: (value) => controller.motorcycle.value.typeMotor =
                    value, // Bind input to model
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Plat Motor",
                hintText: "KH 1213 WH",
                onChanged: (value) =>
                    controller.motorcycle.value.platMotor = value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: ButtonMainComponents(
                  buttonName: "Next",
                  nextPage: () {
                    Get.to(AddMotorcycleDetailView(),
                        arguments: controller.motorcycle.value);
                  }),
            )
          ],
        ),
      ),
    );
    // TODO: implement build
  }
}
