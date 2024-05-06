import 'package:flutter/material.dart';
import 'package:flutter_learn/core/graph_ql_config.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/fly_behavior_imp/fly_no_way.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/fly_behavior_imp/fly_with_wings_imp.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/quack_behavior_imp/quack_behavior_imp.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/data/respository/quack_behavior_imp/squeak_behavior.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/domain/duck.dart';
import 'package:flutter_learn/shared_preferences/cache_helper.dart';
import 'package:flutter_learn/shared_preferences/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // final mallardDuck = Duck(
  //     flyBehavior: ShortFlyBehaviorImp(),
  //     quackBehavior: QuackBehaviorRepositoryImp());
  // Creating ducks with different behaviors
  Duck mallardDuck = Duck(
    flyBehavior: FlyWithWings(),
    quackBehavior: QuackBehaviorRepositoryImp(),
  );
  Duck rubberDuck = Duck(
    flyBehavior: FlyNoWay(),
    quackBehavior: SqueakBehaviorImp(),
  );

  // Performing behaviors
  print("Mallard Duck:");
  mallardDuck.performFly();
  mallardDuck.performQuack();
  mallardDuck.swim();

  print("\nRubber Duck:");
  rubberDuck.performFly();
  rubberDuck.performQuack();
  rubberDuck.swim();

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier(
    GraphQLConfig.client,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GraphQLProvider(
        client: clientNotifier,
        child: const CacheProvider(
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
