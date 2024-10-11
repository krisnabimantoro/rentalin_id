import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';
import 'package:rentalin_id/app/widgets/button_float.components.dart';
import 'package:rentalin_id/app/widgets/cardManage.component.dart';
import 'package:rentalin_id/app/widgets/search_field.components.dart';

import '../controllers/manage_motorcycle_controller.dart';

class ManageMotorcycleView extends GetView<ManageMotorcycleController> {
  const ManageMotorcycleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          // leadingWidth: 344,
          elevation: 0,
          backgroundColor: tdBg,
          toolbarHeight: 80,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.centerLeft,
              width: 344,
              height: 56,
              padding: const EdgeInsets.only(left: 25),
              decoration: const BoxDecoration(
                  color: tdBlue,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "Manage Motorcycle",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: tdWhite),
              ),
            ),
          )),
      body: BottomBar(
          body: (BuildContext context, ScrollController controller) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        // alignment: Alignment.center,
                        child: SizedBox(
                            width: 343,
                            height: 60,
                            child: SearchFieldComponents()),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 3),
                              decoration: const BoxDecoration(
                                  color: tdBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: const Text(
                                "All",
                                style: TextStyle(
                                    color: tdWhite,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const FilterComponent(fillText: "Honda"),
                          const SizedBox(
                            width: 15,
                          ),
                          const FilterComponent(fillText: "Yamaha"),
                          const SizedBox(
                            width: 15,
                          ),
                          const FilterComponent(fillText: "Suzuki")
                        ],
                      ),
                      CardManageMotor(),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  ButtonFloatComponents(
                      buttonName: "Add New Motorcycle", nextPage: () {}),
                  SizedBox(
                    height: 14,
                  )
                ]);
          },
          width: 343,
          barColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: const ChildBottomBar()),
    );
  }
}


class FilterComponent extends StatelessWidget {
  final String fillText;
  const FilterComponent({super.key, required this.fillText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        decoration: const BoxDecoration(
            color: tdthirdBlue,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Text(
          fillText,
          style: TextStyle(color: tdBlue, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
