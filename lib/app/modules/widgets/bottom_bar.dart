import 'package:flutter/material.dart';

import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class BottomFloatBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomBar(
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
    );
  }
}
