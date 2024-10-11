import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // surfaceTintColor: tdGrey,
            scrolledUnderElevation: 0,
            // leadingWidth: 344,
            elevation: 0,
            backgroundColor: tdBg,
            toolbarHeight: 100,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            title: const AppBarComponents(nameMenu: 'Notifications',)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
              children: [cardNotif(), cardNotif(), cardNotif(), cardNotif()]),
        ));
  }
}

class cardNotif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: (){Get.to(SignupView());},
        child: Container(
          
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: tdGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          width: 345,
          height: 217,
          margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Finish Date Rent",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text("Full Name"),
                  Text("No Handphone"),
                  Text("Motorcycle"),
                  Text("Plat Motor"),
                  Text(""),
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
                  Text("PCX 2024"),
                  Text("KH 2021 WG"),
                  Text(
                    "Click to Detail",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
