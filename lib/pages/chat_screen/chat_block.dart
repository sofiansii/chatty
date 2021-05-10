import 'package:chatty/api/users.dart';
import 'package:chatty/pages/common/colors.dart';
import 'package:flutter/material.dart';

class ChatBlock extends StatelessWidget {
  final User user;

  final List<Map<String, String>> msgs;
  ChatBlock(this.user, this.msgs);
  @override
  Widget build(BuildContext context) {
    var fromMe = msgs[0]["who"] == "me";
    var nameText = Text("${user.name.first} ${user.name.last}",
        style: Theme.of(context).textTheme.caption);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!fromMe)
              Column(children: [
                Padding(
                  padding: EdgeInsets.all(13),
                  child: CircleAvatar(
                    backgroundColor: GClightGrey,
                    minRadius: 20,
                    backgroundImage: NetworkImage(user.picture.medium),
                  ),
                )
              ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (!fromMe)
                _BlockContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameText,
                    SizedBox(height: 2),
                    msgs[0]["type"] == "image"
                        ? _ImageMsg(msgs[0]["url"])
                        : _TextMsg(msgs[0]["text"]),
                  ],
                )),
              for (var m in msgs.skip(fromMe ? 0 : 1))
                if (m["type"] == "image")
                  _BlockContainer(child: _ImageMsg(m["url"]))
                else
                  _BlockContainer(child: _TextMsg(m["text"]))
            ])
          ]),
    );
  }
}

class _BlockContainer extends StatelessWidget {
  final Widget child;
  _BlockContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: GClightGrey),
      child: this.child,
    );
  }
}

class _TextMsg extends StatelessWidget {
  final String msg;
  _TextMsg(this.msg);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: Text(msg,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500,
                color: GCmessageTextColor,
                fontSize: 18)));
  }
}

class _AudioMsg extends StatelessWidget {
  final String audioUrl;
  _AudioMsg(this.audioUrl);
  @override
  Widget build(BuildContext context) {
    return Row();
  }
}

class _ImageMsg extends StatelessWidget {
  final String imageUrl;
  _ImageMsg(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 700),
        child: Image.network(
          this.imageUrl,
          fit: BoxFit.fitWidth,
          // height: 700,
          width: MediaQuery.of(context).size.width * 0.6,
        ));
  }
}
