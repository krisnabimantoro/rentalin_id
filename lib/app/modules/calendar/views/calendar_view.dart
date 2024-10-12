import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/history-page/views/history_page_view.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 157,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Container(
              width: 343, // Width of the card
              height: 150, // Height of the card
              padding: const EdgeInsets.all(16), // Padding inside the container
              decoration: BoxDecoration(
                color: tdBlue, // Background color of the card
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title Text
                      Text(
                        'Check History',
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: 31, // Title size
                          fontWeight: FontWeight.bold, // Bold font
                        ),
                      ),
                      // Subtitle Text
                      Text(
                        'Calendar',
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: 25, // Subtitle size
                        ),
                      ),
                    ],
                  ),
                  // Icon in the top-right corner
                  Positioned(
                    right: 0,
                    top: 0,
                    child: InkWell(
                      onTap: () {
                        Get.to(const HistoryPageView());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white, // White background for the icon
                          shape: BoxShape.circle, // Circular shape
                        ),
                        child: const Icon(
                          Icons.history, // History/clock icon
                          color: Colors.black, // Black icon color
                          size: 24, // Icon size
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
      body: BottomBar(
          body: (BuildContext context, ScrollController controller) {
            return Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Date Card 1 (Normal)
                    _buildDateCard(
                        day: '17', weekday: 'MON', isSelected: false),
                    // Date Card 2 (Selected)
                    _buildDateCard(day: '18', weekday: 'TUE', isSelected: true),
                    // Date Card 3 (Normal)
                    _buildDateCard(
                        day: '19', weekday: 'WED', isSelected: false),
                    // Date Card 4 (Normal)
                    _buildDateCard(
                        day: '20', weekday: 'THU', isSelected: false),
                    // Date Card 5 (Normal)
                    _buildDateCard(
                        day: '21', weekday: 'FRI', isSelected: false),
                  ],
                ),
                CardListOnBook(),
                CardListOnBook(),
                CardListOnBook(),
              ],
            );
          },
          width: 343,
          barColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: const ChildBottomBar()),
    );
  }
}

class CardListOnBook extends StatelessWidget {
  const CardListOnBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "On Booking By",
                    style: TextStyle(
                        color: tdorange,
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

Widget _buildDateCard({
  required String day,
  required String weekday,
  required bool isSelected,
}) {
  return Container(
    width: 60, // Adjust the width of each date card
    height: 80, // Adjust the height of each date card
    decoration: BoxDecoration(
      color: isSelected ? Colors.white : Colors.white, // Highlight if selected
      borderRadius: BorderRadius.circular(6),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isSelected ? tdBlue : tdGrey, // Blue if selected
          ),
        ),
        SizedBox(height: 4), // Spacing between day and weekday
        Text(
          weekday,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.blue : Colors.grey, // Blue if selected
            fontWeight: isSelected
                ? FontWeight.bold
                : FontWeight.normal, // Bold if selected
          ),
        ),
      ],
    ),
  );
}
