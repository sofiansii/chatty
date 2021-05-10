import 'package:chatty/pages/common/colors.dart';
import 'package:chatty/pages/recent_page/recent_chats.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgrounds/login_background.png"),
              fit: BoxFit.fill)),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Icon(
          Icons.perm_phone_msg_outlined,
          color: GCpink,
          size: 100,
        ),
        SizedBox(height: 20),
        Text("Never Been Eisier",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white)),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            "Communicate With Your beloved ones in the blink of an eye",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(height: 130),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Material(
            color: GCpink,
            child: TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (c) => Material(child: RecentChats()))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 70),
                child: Text(
                  "Login With Email",
                  style: Theme.of(context).textTheme.headline6.copyWith(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text("New User? Sign Up",
            style:
                Theme.of(context).textTheme.bodyText1.copyWith(color: GCpink)),
        SizedBox(height: 130),
        Text("Help?",
            style:
                Theme.of(context).textTheme.bodyText1.copyWith(color: GCpink)),
        SizedBox(height: 150)
      ]),
    );
  }
}
