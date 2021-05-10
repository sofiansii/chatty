import 'package:chatty/api/users.dart';
import 'package:chatty/pages/common/colors.dart';
import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  final User user;
  InfoBar(this.user);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
            tag: user.picture,
            child: CircleAvatar(
              minRadius: 22,
              maxRadius: 22,
              backgroundImage: NetworkImage(user.picture.medium),
            )),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Hero(
              tag: user.name,
              child: Text(user.name.first + " " + user.name.last,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.white)),
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.videocam_outlined, size: 30),
            color: GCneonPink,
            // splashColor: ,
            splashRadius: 22,
            onPressed: () {}),
        IconButton(
            icon: Icon(Icons.call_outlined, size: 30),
            color: GCneonPink,
            splashRadius: 22,
            onPressed: () {})
      ],
    );
  }
}
