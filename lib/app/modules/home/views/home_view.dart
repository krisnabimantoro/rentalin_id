import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/login/views/login_view.dart';
import 'package:rentalin_id/app/modules/widgets/bottom_bar.dart';

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
        bottomNavigationBar: BottomFloatBar());
  }
}
