import 'package:flutter/material.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

class ButtonGoogle extends StatelessWidget {
  final String iconPath;
  final String labelText;
  final VoidCallback onPressed;

  const ButtonGoogle(
      {super.key, required this.iconPath, required this.labelText,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        height: 52,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(iconPath),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: tdWhite,
              foregroundColor: tdGrey,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: tdGrey),
                borderRadius: BorderRadius.circular(10),
              )),
          label: Text(
            labelText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
