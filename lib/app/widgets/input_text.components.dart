import 'package:flutter/material.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

class InputText extends StatelessWidget {
  final String labelText; // Label text
  final String hintText; // Hint text
  final String iconPath; // Path to the icon

  const InputText({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: tdBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          cursorColor: tdSecBlue,
          style: const TextStyle(color: tdBlue, fontSize: 15),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                iconPath,
                width: 20,
                height: 20,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: tdWhite,
            hoverColor: tdSecBlue,
            filled: true,
            alignLabelWithHint: false,
            hintText: hintText,
            hintStyle: const TextStyle(color: tdSecBlue),
          ),
        ),
      ],
    );
  }
}
