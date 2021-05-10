import 'package:chatty/pages/common/colors.dart';
import 'package:chatty/pages/recent_page/chats.dart';
import 'package:chatty/pages/recent_page/friends_bar.dart';
import 'package:chatty/pages/recent_page/info_bar.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: GCdarkBlue),
      Container(height: 170, child: InfoBar()),
      Container(
        margin: EdgeInsets.only(top: 170),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Colors.white),
        child: Column(
          children: [
            Container(
              height: 120,
              child: FriendsBar(),
            ),
            Expanded(child: Chats())
          ],
        ),
      )
    ]);
  }
}
