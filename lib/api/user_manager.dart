import 'dart:convert';

import 'package:chatty/api/users.dart';
import 'package:http/http.dart' as http;

class UserManager {
  static Future<User> getUser() async {
    try {
      var res = await http.read(Uri.https("randomuser.me", "api"));
      RandUsers users = new RandUsers.fromJson(jsonDecode(res));
      return users.users[0];
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  static Future<List<User>> getUsers(int num) async {
    try {
      var res = await http
          .read(Uri.https("randomuser.me", "api", {"results": "$num"}));

      RandUsers users = new RandUsers.fromJson(jsonDecode(res));
      return users.users;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
