import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/rent/views/rentDetail_view.dart';

import '../../../data/constant/color.dart';
import '../../../widgets/app_bar.components.dart';
import '../controllers/rent_controller.dart';
import 'rent_view.dart';
import 'rent3_view.dart';

class Rent4View extends GetView<RentController> {
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
            detRent(),
            SizedBox(height: 10,),
            BtnBk3(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BtnBook(),
                SizedBox(width: 10,),
                BtnRent(),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class detRent extends StatelessWidget {
  const detRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 20),
      height: 639,
      width: 344,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(8),
       color: tdWhite,
      ),
      child: Column(
        children: [
          Container( 
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: tdGrey),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            width: 314,
            height: 200,
            margin: EdgeInsets.only(top: 5 ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Renter's",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("Full Name"),
                    Text("Hometown"),
                    Text("No handphone 1"),
                    Text("No handphone 2"),
                    Text("Helm"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "",
                    ),
                    Text("Krisna Bimantoro"),
                    Text("+6281231231"),
                    Text("+6281231231"),
                    Text("KH 2021 WG"),
                    Text("Cargloss 1"),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10,),

          Container( 
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: tdGrey),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            width: 314,
            height: 181,
            margin: EdgeInsets.only(top: 5 ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Days and Clock",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("start Date"),
                        SizedBox(width: 90,),
                        Text("27 September 2024"),
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("End Date"),
                        SizedBox(width: 95,),
                        Text("29 September 2024"),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Clock Start"),
                        SizedBox(width: 173,),
                        Text("13:00"),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Clock End"),
                        SizedBox(width: 180,),
                        Text("17:00"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Container( 
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: tdGrey),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            width: 314,
            height: 181,
            margin: EdgeInsets.only(top: 5 ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Address and Payment",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Address"),
                        SizedBox(width: 39,),
                        Text("Jln. Tlogomas, SPBU"),
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pickup Address"),
                        SizedBox(width: 46,),
                        Text("Jln. Tlogomas, SPBU"),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Method Payment"),
                        SizedBox(width: 135,),
                        Text("Tunai"),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payment"),
                        SizedBox(width: 115,),
                        Text("Rp. 300.000", 
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                      ],
                    ),  
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BtnBk3 extends StatelessWidget {
  const BtnBk3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const Rent3View());
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

class BtnBook extends StatelessWidget {
  const BtnBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(RentDetail());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFF9500),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Booking",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnRent extends StatelessWidget {
  const BtnRent({super.key});

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
          backgroundColor: Color(0xff34C759),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Rent Now",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}