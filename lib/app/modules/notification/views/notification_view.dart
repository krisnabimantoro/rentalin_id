import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/signup/views/signup_view.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/card_Notification.component.dart';

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
            toolbarHeight: 80,
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
        child: CardNotification(),
      ),
    );
  }
}
