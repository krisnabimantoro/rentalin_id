import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/constant/color.dart';

class AppBarComponents extends StatelessWidget {
  final String nameMenu;

  const AppBarComponents({super.key, required this.nameMenu});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 344,
        height: 60,

        alignment: Alignment.center,
        // color: tdWhite,
        padding: EdgeInsets.fromLTRB(10, 10, 18, 10),
        decoration: const BoxDecoration(
            color: tdWhite,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        // padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration:
                  const BoxDecoration(color: tdBlue, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Image.asset(
                      "assets/icon/arrow-left.png",
                      color: Colors.white,
                    ),
                  )),
            ),
            Text(
              nameMenu,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: tdBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
