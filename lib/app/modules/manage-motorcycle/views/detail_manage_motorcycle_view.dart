import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/data/models/motor.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/add_motorcyle_controller.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/models/motorcycle.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/manage_motorcycle_view.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/update_motorcycle_view.dart';
import 'package:rentalin_id/app/modules/webview-page/views/webview_page_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

import '../controllers/manage_motorcycle_controller.dart';

class DetailManageMotorcycleView extends GetView<AddMotorcycleController> {
  // final Datum dataLoad;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final ManageMotorcycleController _controller =
  //     Get.put(ManageMotorcycleController());
  // final String motorcycleId;

  // Stream<QuerySnapshot> _getTasks() {
  //   return _firestore.collection('Manage Motorcycle').snapshots();
  // }
  // final arguments = Get.arguments ?? {};

  // final motorcycleId = arguments['motorcycleId'] as String?;
  // final merkMotor = Get.arguments['merkMotor'] as String?;
  // final motorName = Get.arguments['motorName'] as String?;
  // final platMotor = Get.arguments['platMotor'] as String?;
  // final pricePerDay = Get.arguments['pricePerDay'] as double?;
  // final recommendation = Get.arguments['recommendation'] as bool?;
  // final typeMotor = Get.arguments['typeMotor'] as String?;

  const DetailManageMotorcycleView({
    super.key,
  });

  String? get id => null;

  @override
  Widget build(BuildContext context) {
    // _controller.fetchMotorcycleDetails(motorcycleId);
    // var data = _controller.motorcycle;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Get.lazyPut(() => AddMotorcycleController());
    // final Motorcycle motorcycle = Get.arguments as Motorcycle;

    final arguments = Get.arguments;

    final String motorcycleId = arguments['motorcycleId'] ?? 'Unknown ID';
    final String merkMotor = arguments['merkMotor'] ?? 'Unknown Merk';
    final String motorName = arguments['motorName'] ?? 'Unknown Name';
    final String platMotor = arguments['platMotor'] ?? 'Unknown Plat';
    final double pricePerDay = arguments['pricePerDay'] ?? 0.0;
    final bool recommendation = arguments['recommendation'] ?? false;
    final String typeMotor = arguments['typeMotor'] ?? 'Unknown Type';

    controller.motorcycle.value.motorcycleId = motorcycleId;
    controller.motorcycle.value.merkMotor = merkMotor;
    controller.motorcycle.value.motorName = motorName;
    controller.motorcycle.value.platMotor = platMotor;
    controller.motorcycle.value.pricePerDay = pricePerDay;
    controller.motorcycle.value.isRecommended = recommendation;
    controller.motorcycle.value.typeMotor = typeMotor;

    print("cek ${controller.motorcycle.value.motorcycleId}");
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
            nameMenu: 'Detail Manage Motorcycle',
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 344,
                  height: 148,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(""), fit: BoxFit.cover),
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
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                          const Text("Plat Motor"),
                          Text(
                            "Price/Day",
                            style: TextStyle(color: tdgreen),
                          ),
                          // Text(data['Merk Motor'] ?? ''),
                          // Text(data['Motor Name'] ?? ''),
                          // Text(data['Type Motor'] ?? ''),
                          // Text(data['Plat Motor'] ?? ''),
                          // Text(
                          //   data['Price'] ?? '',
                          // style: const TextStyle(color: tdgreen),
                          // ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "",
                          ),
                          Text('$merkMotor'),
                          Text('$motorName'),
                          Text('$typeMotor'),
                          Text('$platMotor'),
                          Text(
                            ('$pricePerDay'),
                            style: const TextStyle(color: tdgreen),
                          )
                          // Text(dataLoad.typeMotor),
                          // Text(dataLoad.motorName),
                          // const Text("Matic"),
                          // Text(dataLoad.platMotor),
                          // Text(
                          //   dataLoad.pricePerDay.toString(),
                          //   style: TextStyle(color: tdgreen),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 220,
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
                    onPressed: () async {
                      bool? confirmDelete = await _showDeleteDialog(context);
                      if (confirmDelete == true) {
                        // print(motorcycleId),
                        await firestore
                            .collection('Manage MotorCycle')
                            .doc(motorcycleId)
                            .delete();

                        Get.to(ManageMotorcycleView());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white, // Text color
                      side: const BorderSide(color: Colors.red), // Border color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.red,
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
                    onPressed: () {
                      Get.to(UpdateMotorcycleView(),
                          arguments: controller.motorcycle.value);
                      // Define what happens when "Add New" is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: tdorange, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Update',
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

Future<bool?> _showDeleteDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Hapus Motor'),
        content: const Text('Apakah Anda yakin ingin menghapus Motor ini?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali dengan false
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Kembali dengan true
            },
            child: const Text('Hapus'),
          ),
        ],
      );
    },
  );
}
