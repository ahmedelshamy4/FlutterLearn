import 'package:flutter/material.dart';
import 'package:flutter_learn/get_data_with_filter/my_page.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/fly_behavior_imp/no_fly_behavior_imp.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/fly_behavior_imp/short_fly_behavior_imp.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/quack_behavior_imp/quack_behavior_imp.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/quack_behavior_imp/squeak_behavior.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/domain/duck.dart';
import 'package:flutter_learn/shared_preferences/cache_helper.dart';
import 'package:flutter_learn/shared_preferences/home_page.dart';
import 'package:flutter_learn/test_app.dart';

import 'learn_design_pattern/strategy/data/respository/fly_behavior_imp/long_fly_behavior_imp.dart';

void main() async {
  final mallardDuck = Duck(
      flyBehavior: ShortFlyBehaviorImp(),
      quackBehavior: QuackBehaviorRepositoryImp());

  final rubberDuck =
      Duck(flyBehavior: NoFlyBehaviorImp(), quackBehavior: SqueakBehaviorImp());
  mallardDuck.performFly();
  mallardDuck.performQuack();

  rubberDuck.performFly();
  rubberDuck.performQuack();

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyPage(),
    );
  }
}
