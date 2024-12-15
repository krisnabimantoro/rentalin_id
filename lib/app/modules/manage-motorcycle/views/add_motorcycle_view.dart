import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/add_motorcyle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/add_motorcycle_detail_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

import '../../../widgets/videoPlayerWidget.dart';
import '../controllers/camera_motorcycle_controller.dart';

class AddMotorcycleView extends GetView<AddMotorcycleController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddMotorcycleController());
    Get.lazyPut(()=>CameraController());
    
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
                    onPressed: () async {
                      final controller = Get.find<CameraController>();
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Choose Action"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo_camera),
                                  title: const Text("Take Photo"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    await controller.pickImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: const Text("Pick from Gallery"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    await controller.pickImage(ImageSource.gallery);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.videocam),
                                  title: const Text("Take Video"),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    await controller.pickVideo(ImageSource.camera);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdWhite,
                      foregroundColor: tdWhite,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: tdBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Obx(() {
                      final controller = Get.find<CameraController>();

                      if (controller.selectedImagePath.value.isEmpty &&
                          controller.selectedVideoPath.value.isEmpty) {
                        return Image.asset(
                          "assets/icon/image-plus.png",
                          width: 100,
                          height: 100,
                        );
                      }

                      if (controller.selectedImagePath.value.isNotEmpty) {
                        return Image.file(
                          File(controller.selectedImagePath.value),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        );
                      }

                      if (controller.selectedVideoPath.value.isNotEmpty) {
                        return VideoPlayerWidget(videoPath: controller.selectedVideoPath.value);
                      }

                      return const SizedBox.shrink();
                    }),
                  ),
                ),
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
