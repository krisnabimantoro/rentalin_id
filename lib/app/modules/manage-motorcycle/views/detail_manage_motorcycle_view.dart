import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/data/models/motor.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/update_motorcycle_view.dart';
import 'package:rentalin_id/app/modules/webview-page/views/webview_page_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

import '../controllers/manage_motorcycle_controller.dart';

class DetailManageMotorcycleView extends StatelessWidget {
  final Datum dataLoad;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ManageMotorcycleController _controller =
      Get.put(ManageMotorcycleController());
  final String motorcycleId;

  Stream<QuerySnapshot> _getTasks() {
    return _firestore.collection('Manage Motorcycle').snapshots();
  }

  DetailManageMotorcycleView(
      {super.key, required this.dataLoad, required this.motorcycleId});

  String? get id => null;

  @override
  Widget build(BuildContext context) {
    _controller.fetchMotorcycleDetails(motorcycleId);
    var data = _controller.motorcycle;
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://10.0.2.2:4300/" + dataLoad.fileName),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Detail Motor",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(data['Merk Motor'] ?? ''),
                          Text(data['Motor Name'] ?? ''),
                          Text(data['Type Motor'] ?? ''),
                          Text(data['Plat Motor'] ?? ''),
                          Text(
                            data['Price'] ?? '',
                            style: const TextStyle(color: tdgreen),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "",
                          ),
                          Text(dataLoad.motorType),
                          Text(dataLoad.motorName),
                          const Text("Matic"),
                          Text(dataLoad.motorPlat),
                          Text(
                            dataLoad.pricePerDay.toString(),
                            style: TextStyle(color: tdgreen),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
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
                        await _firestore
                            .collection('Manage Motorcycle')
                            .doc(id)
                            .delete();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white, // Text color
                      side: BorderSide(color: Colors.red), // Border color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: Text(
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
                      Get.to(UpdateMotorcycleView());
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
                    child: Text(
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
        title: Text('Hapus Motor'),
        content: Text('Apakah Anda yakin ingin menghapus Motor ini?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali dengan false
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Kembali dengan true
            },
            child: Text('Hapus'),
          ),
        ],
      );
    },
  );
}
