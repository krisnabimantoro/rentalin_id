import 'package:flutter/material.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

class ButtonGoogle extends StatelessWidget {
  final String iconPath;
  final String labelText;

  const ButtonGoogle(
      {super.key, required this.iconPath, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        height: 52,
        child: ElevatedButton.icon(
          onPressed: () {},
          // icon: Icon(Image.asset("assets/icon/google.svg") as IconData?),
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(iconPath),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: null,
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
