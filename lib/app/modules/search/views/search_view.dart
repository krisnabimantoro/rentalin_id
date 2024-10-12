import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: tdBg,
      body: ListView(
        children: [
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
      // bottomNavigationBar: BottomFloatBar()
    );
  }
}

class Scr extends StatelessWidget {
  const Scr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0xff1966FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            backgroundColor: tdBlue,
            foregroundColor: tdWhite,
          ),
          child: Icon(
            Icons.search,
          )),
    );
  }
}

class ScrBar extends StatelessWidget {
  const ScrBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 284,
      // padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Color(0xff1966FF))
          ),
      child: const TextField(
          cursorColor: tdSecBlue,
          style: TextStyle(color: tdBlue, fontSize: 16),
          decoration: InputDecoration(
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
            filled: true,
            alignLabelWithHint: false,
            hintText: "Searching",
            hintStyle: TextStyle(color: tdSecBlue),
          ),
        ),
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
        SizedBox(
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
              backgroundColor: Color(0xffC7DAFF),
              foregroundColor: Color(0xff1966FF),
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
        SizedBox(
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
              backgroundColor: Color(0xffC7DAFF),
              foregroundColor: Color(0xff1966FF),
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
        SizedBox(
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
              backgroundColor: Color(0xffC7DAFF),
              foregroundColor: Color(0xff1966FF),
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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          CardListOnBook()
        ],
      ),
    );
  }
}

class CardAvailable extends StatelessWidget {
  const CardAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          CardListMotor(

          )
        ],
      ),
    );
  }
}

class CardRent extends StatelessWidget {
  const CardRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
       CardListOnRent()
        ],
      ),
    );
  }
}
