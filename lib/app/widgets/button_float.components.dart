import 'package:flutter/material.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

class ButtonFloatComponents extends StatelessWidget {
  final String buttonName;
  final VoidCallback nextPage;

  const ButtonFloatComponents(
      {super.key, required this.buttonName, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 344,
        height: 52,
        child: FloatingActionButton(
          onPressed: () {
            nextPage();
          },
          backgroundColor: tdBlue,
          foregroundColor: tdWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
