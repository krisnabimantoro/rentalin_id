import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rentalin_id/app/data/constant/color.dart';

class SearchFieldComponents extends StatelessWidget {
  const SearchFieldComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: tdSecBlue,
        style: const TextStyle(color: tdBlue, fontSize: 15),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              "assets/icon/search.png",
              width: 24,
              height: 24,
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
          hintText: "Searching",
          hintStyle: const TextStyle(color: tdSecBlue, fontSize: 16),
        ));
  }
}
