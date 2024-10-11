import 'package:flutter/material.dart';

class ChildBottomBar extends StatelessWidget {
  const ChildBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ));
  }
}
