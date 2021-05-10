import 'package:chatty/api/user_manager.dart';
import 'package:chatty/api/users.dart';
import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.all(8.0).copyWith(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: UserManager.getUser(),
              builder: (c, snp) {
                if (snp.data == null)
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                  );
                else
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    minRadius: 23,
                    backgroundImage:
                        NetworkImage((snp.data as User).picture.medium),
                  );
              },
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                        child:
                            Icon(Icons.search, color: Colors.white, size: 32)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Messages",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white),
          ),
        ),
      ])
    ]);
  }
}
