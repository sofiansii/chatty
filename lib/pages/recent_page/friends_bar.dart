import 'package:chatty/api/user_manager.dart';
import 'package:chatty/api/users.dart';
import 'package:chatty/pages/chat_screen/chat_screen.dart';
import 'package:chatty/pages/common/colors.dart';
import 'package:flutter/material.dart';

class FriendsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: UserManager.getUsers(13),
          builder: (c, AsyncSnapshot<List<User>> snp) {
            if (snp.data == null)
              return Container();
            else
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var user in snp.data)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => ChatScreen(user))),
                          child: _FriendInfo(user)),
                    )
                ],
              );
          }),
    );
  }
}

class _FriendInfo extends StatelessWidget {
  final User user;
  _FriendInfo(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: user.picture,
          child: CircleAvatar(
            minRadius: 30,
            backgroundColor: GCdarkBlue,
            backgroundImage: NetworkImage(user.picture.medium),
          ),
        ),
        SizedBox(height: 2),
        Hero(
            tag: user.name,
            child: Text(
              user.name.first,
              style: Theme.of(context).textTheme.bodyText2,
            ))
      ],
    );
  }
}
