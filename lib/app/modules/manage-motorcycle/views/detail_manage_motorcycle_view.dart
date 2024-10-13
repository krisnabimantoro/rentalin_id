import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/data/models/motor.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/update_motorcycle_view.dart';
import 'package:rentalin_id/app/modules/webview-page/views/webview_page_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

class DetailManageMotorcycleView extends StatelessWidget {
  final Datum dataLoad;

  const DetailManageMotorcycleView({super.key, required this.dataLoad});
  @override
  Widget build(BuildContext context) {
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
                          Text(
                            "Price/day",
                            style: TextStyle(color: tdgreen),
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
                    onPressed: () {
                      Get.to(WebviewPageView());
                      // Define what happens when "Go Back" is pressed
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
