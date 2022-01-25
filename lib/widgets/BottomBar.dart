import 'package:era_elearn/drawerActions/coupon.dart';
import 'package:era_elearn/screens/likes.dart';
import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/screens/notifications.dart';
import 'package:flutter/material.dart';

import 'commonText.dart';
import 'navigationWidgets.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int show = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
            onPressed: () {
              setState(() {
                show = 0;
              });
              ChangeScreen(context, MainScreen());
            },
            color: Colors.grey[100],
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 6,
                ),
                show == 0
                    ? const CommonText(
                        text: 'Home',
                        size: 20,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                show = 1;
              });
              ChangeScreen(context, WishList());
            },
            color: Colors.grey[100],
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 6,
                ),
                show == 1
                    ? const CommonText(
                        text: 'Likes',
                        size: 20,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                show = 2;
              });
              ChangeScreen(context,  Notifications());
            },
            color: Colors.grey[100],
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 6,
                ),
                show == 2
                    ? const CommonText(
                        text: 'Notifications',
                        size: 20,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
