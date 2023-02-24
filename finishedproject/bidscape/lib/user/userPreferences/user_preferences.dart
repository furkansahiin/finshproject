import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';

class RememberUserPrefs {
  // save user data user info

  static Future<void> storeUserInfo(User userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());

    await prefs.setString("currentUser", userJsonData);
  }

  // get user data user info

  static Future<User?> readUserInfo() async {
    User? currentUserInfo;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfo = prefs.getString("currentUser");

    if (userInfo != null) {
      Map<String, dynamic> userMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userMap);
    }
    return currentUserInfo;
  }

  // remove user data user info

  static Future<void> removeUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("currentUser");
  }
}
