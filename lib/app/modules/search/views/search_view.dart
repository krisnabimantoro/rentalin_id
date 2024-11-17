import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/calendar/views/calendar_view.dart';
import 'package:rentalin_id/app/modules/search/views/searchAvail_view.dart';
import 'package:rentalin_id/app/modules/search/views/searchBooked_view.dart';
import 'package:rentalin_id/app/modules/search/views/searchRent_view.dart';
import 'package:rentalin_id/app/widgets/CardlistmotorOnBooked.dart';
import 'package:rentalin_id/app/widgets/CardlistmotorOnRent.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';
import 'package:rentalin_id/app/widgets/cardList.component.dart';

import '../../rent/views/rent_view.dart';
import '../controllers/search_controller.dart';
import '../../../data/constant/color.dart';

class SearchView extends GetView<SearchingController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchingController());
    print("rill "+controller.text.value);
    return Scaffold(
        backgroundColor: tdBg,
        body: BottomBar(
          width: 343,
          barColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          body: (BuildContext context, ScrollController controller) => ListView(
            children: const [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScrBar(),
                  SizedBox(
                    width: 20,
                  ),
                  Scr(),
                  
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ScrOpAll(),
              SizedBox(
                height: 10,
              ),
              CardBooked(),
              CardAvailable(),
              CardRent(),
            ],
          ),
          child: const ChildBottomBar(),
        )
        // bottomNavigationBar: BottomFloatBar()
        );
  }
}

class Scr extends GetView<SearchingController> {
  const Scr({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchingController());
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: const Color(0xff1966FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
          onPressed: () {
            if (controller.isListening.value) {
              controller.stopListening();
            } else {
              controller.startListening();
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            backgroundColor: tdBlue,
            foregroundColor: tdWhite,
          ),
          child: const Icon(
            Icons.mic,
          )),
    );
  }
}

class ScrBar extends GetView<SearchingController> {
  const ScrBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchingController());
    return Container(
      height: 50,
      width: 284,
      // padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Color(0xff1966FF))
      ),
      child: Obx(() => TextField(
            controller: TextEditingController(text: controller.text.value)
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.value.length),
              ),
            cursorColor: tdSecBlue,
            style: const TextStyle(color: tdBlue, fontSize: 16),
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: tdSecBlue),
                borderRadius: BorderRadius.all(Radius.circular(1000)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: tdSecBlue),
                borderRadius: BorderRadius.all(Radius.circular(1000)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: tdSecBlue),
                borderRadius: BorderRadius.all(Radius.circular(1000)),
              ),
              fillColor: tdWhite,
              hoverColor: tdSecBlue,
              contentPadding: EdgeInsets.only(left: 20),
              filled: true,
              alignLabelWithHint: false,
              hintText: "Searching",
              hintStyle: TextStyle(color: tdSecBlue),
            ),
            onChanged: (value) {
              controller.text.value = value; // Update Rx observable
            },
          )),
    );
  }
}

class ScrOpAll extends StatelessWidget {
  const ScrOpAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 70,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const SearchView());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: tdBlue,
              foregroundColor: tdWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "All",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 98,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const SearchAvailView());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffC7DAFF),
              foregroundColor: const Color(0xff1966FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Available",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 90,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const SearchBookedView());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffC7DAFF),
              foregroundColor: const Color(0xff1966FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Booked",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 92,
          height: 30,
          child: ElevatedButton(
            onPressed: () {
              Get.to(const SearchRentView());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffC7DAFF),
              foregroundColor: const Color(0xff1966FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "On Rent",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

class CardBooked extends StatelessWidget {
  const CardBooked({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Column(
        children: [CardListOnBook()],
      ),
    );
  }
}

class CardAvailable extends StatelessWidget {
  const CardAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Column(
        children: [CardListMotor()],
      ),
    );
  }
}

class CardRent extends StatelessWidget {
  const CardRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Column(
        children: [CardListOnRent()],
      ),
    );
  }
}
