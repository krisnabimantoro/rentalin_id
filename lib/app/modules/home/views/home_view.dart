import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/login/views/login_view.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          // centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: BottomBar(
      body: (BuildContext context, ScrollController controller) {
        return Container();
      },
      width: 343,
      barColor: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/icon/bottombar/home.png",
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/icon/bottombar/search.png",
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/icon/bottombar/plus-square.png",
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/icon/bottombar/calendar-range.png",
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Image.asset(
                    "assets/icon/bottombar/user.png",
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
