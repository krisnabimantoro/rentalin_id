import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';

import '../controllers/rent_controller.dart';
import 'rent4_view.dart';
import 'rent_view.dart';

class Renthistory extends GetView<RentController>{
  const Renthistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 100,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(nameMenu: 'History Rent',),
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                motorP(),
                motorI(),
              ],
            ),
            detRent(),
            SizedBox(height: 20,)
          ],
        ),
      )
     
    );
  }
}