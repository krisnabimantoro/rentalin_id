import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/data/models/motor.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/views/detail_manage_motorcycle_view.dart';

class CardManageMotor extends StatelessWidget {
  final Datum dataLoad;
  const CardManageMotor({
    super.key,
    required this.dataLoad,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            DetailManageMotorcycleView(
              dataLoad: dataLoad, motorcycleId: '',
            ),
            arguments: dataLoad);
      },
      child: Container(
        width: 344,
        height: 95,
        margin: EdgeInsets.only(top: 15),
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://10.0.2.2:4300/" + dataLoad.fileName),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      dataLoad.motorType,
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      dataLoad.motorName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataLoad.motorPlat,
                      style: TextStyle(fontSize: 11, color: tdGrey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          dataLoad.pricePerDay.toString(),
                          style: TextStyle(
                              color: tdBlue, fontWeight: FontWeight.w700),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 33,
                  height: 33,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon/chevron-right.png"),
                      ),
                      color: tdBlue,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                )
                // Column(
                //   children: [
                //     Text(
                //       "...",
                //       style: TextStyle(color: tdBlue),
                //     )
                //   ],
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
