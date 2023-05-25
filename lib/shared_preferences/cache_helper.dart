import 'dart:convert';

import 'package:flutter_learn/shared_preferences/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void setString(String key, String value) =>
      preferences.setString(key, value);

  static void setUser(UserDataModel user) =>
      preferences.setString("user", json.encode(user));

  static String? getString(String key) => preferences.getString(key);

  static UserDataModel? getUser() {
    String? cachedUser = getString("user");
    if (cachedUser == null) {
      return null;
    } else {
      UserDataModel user = UserDataModel.fromJson(json.decode(cachedUser));
      return user;
    }
  }

  static Future<bool> removeUser() => preferences.remove("user");
  static Future<bool> remove(String key) => preferences.remove(key);

  static Future<bool> clear(String key) => preferences.clear();
}
