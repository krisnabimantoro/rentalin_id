import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
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
            title: const AppBarComponents(nameMenu: 'History',)),
       
      body: const SingleChildScrollView(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
