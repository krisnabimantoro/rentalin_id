import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:get/get.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/profile/views/editprofile_view.dart';
import 'package:rentalin_id/app/widgets/bottom_bar.components.dart';

import '../../../data/services/auth.controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          backgroundColor: tdBg,
          // title: const Text('ProfileView'),
          // centerTitle: true,
        ),
        body: BottomBar(
          width: 343,
          barColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          body: (BuildContext context, ScrollController controller) => Column(
            children: [
              const ViewProfile(),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: 347,
                  height: 355,
                  decoration: const BoxDecoration(
                      color: tdWhite,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(EditprofileView());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: tdGrey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    // padding: EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: tdWhite,
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icon/user-cog.png"))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "User Management",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              // padding: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: tdWhite,
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icon/chevron-down.png"))),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          bool result = await signOutFromGoogle();
                          if (result) {
                            Get.offAndToNamed(Routes.LOGIN);
                          } else {
                            print('Logout failed');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: tdGrey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    // padding: EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: tdWhite,
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icon/user-cog.png"))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              // padding: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: tdWhite,
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icon/chevron-down.png"))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          child: const ChildBottomBar(),
        ));
  }
}

class ViewProfile extends StatelessWidget {
  const ViewProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 227,
        width: 344,
        decoration: const BoxDecoration(
            color: tdWhite,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/img/krisna.png")))),
            const Column(
              children: [
                Text(
                  "Krisna Bimantoro",
                  style: TextStyle(
                      color: tdBlue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "WUZZ Rent",
                  style: TextStyle(
                      color: tdGrey, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
