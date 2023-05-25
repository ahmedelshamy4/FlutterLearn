import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learn/shared_preferences/cache_helper.dart';
import 'package:flutter_learn/shared_preferences/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              content,
              style: const TextStyle(fontSize: 20),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                UserDataModel userData =
                    const UserDataModel(id: 1, name: "ahmed", weight: 50);
                CacheHelper.setUser(userData);
                print("Done");
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 20),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                UserDataModel? user = CacheHelper.getUser();
                if (user == null) {
                  content = "No user Data";
                } else {
                  content = user.name;
                }

                setState(() {});
              },
              child: const Text(
                "Load",
                style: TextStyle(fontSize: 20),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                // final SharedPreferences prefs =
                //     await SharedPreferences.getInstance();
                // prefs.remove("user");
                await CacheHelper.removeUser();
                setState(() {
                  content = "";
                });
                print("Removed");
              },
              child: const Text(
                "Remove",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
