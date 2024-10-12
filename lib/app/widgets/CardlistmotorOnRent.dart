import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
class CardListOnRent   extends StatelessWidget {
  const CardListOnRent  ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 95,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
      decoration: BoxDecoration(
          color: tdWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: -3, // How much the shadow spreads
              blurRadius: 6, // How blurry the shadow is
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 103,
                height: 85,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/img1.jpg"),
                        fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.all(Radius.circular(8))),
              ),
              SizedBox(
                width: 12,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Honda",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    "PCX 2024",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "KH 1231 WG",
                    style: TextStyle(fontSize: 11, color: tdGrey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rp 150.000",
                        style: TextStyle(
                            color: tdBlue,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "/Day",
                        style: TextStyle(color: tdGrey),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "On Rent By",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 8,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Krisna Bimantoro",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "...",
                    style: TextStyle(color: tdBlue),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}