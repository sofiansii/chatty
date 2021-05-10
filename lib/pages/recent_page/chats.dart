import 'package:chatty/api/user_manager.dart';
import 'package:chatty/api/users.dart';
import 'package:chatty/pages/chat_screen/chat_screen.dart';
import 'package:chatty/pages/common/colors.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserManager.getUsers(30),
        builder: (c, AsyncSnapshot<List<User>> snp) {
          if (snp.data == null)
            return Container();
          else
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  for (var user in snp.data)
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => ChatScreen(user))),
                        child: _Chat(user))
                ],
              ),
            );
        });
  }
}

class _Chat extends StatelessWidget {
  final User user;

  _Chat(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: IntrinsicHeight(
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Hero(
              tag: user.picture,
              child: CircleAvatar(
                minRadius: 27,
                backgroundColor: GCdarkBlue,
                backgroundImage: NetworkImage(user.picture.medium),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                            child: Hero(
                          tag: user.name,
                          child: Text(
                            user.name.first + " " + user.name.last,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 18),
                          ),
                        )),
                        Text("12:09",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: GCtextDark)),
                      ]),
                      SizedBox(height: 15),
                      Row(children: [
                        Expanded(
                            child: Text("text of the last image",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        color: GCgrey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500))),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: GCpink, shape: BoxShape.circle),
                          child: Text("1"),
                        )
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 1,
                  child: ColoredBox(color: GClightGrey),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
