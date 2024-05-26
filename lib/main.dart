import 'package:flutter/material.dart';
import 'package:flutter_learn/core/graph_ql_config.dart';
import 'package:flutter_learn/flutter_animate/animate_page.dart';
import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/data/respository/fly_behavior_imp/fly_no_way.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/data/respository/fly_behavior_imp/fly_with_wings_imp.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/data/respository/quack_behavior_imp/quack_behavior_imp.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/domain/duck.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/singleton_pattern/singleton_pattern.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/employee.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/machine_operator.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/salary_adepter.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/salary_calculator.dart';
import 'package:flutter_learn/shared_preferences/cache_helper.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/post_page.dart';
import 'package:flutter_learn/simple_video/presentaion/video_scrollable_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'learn_design_pattern/behiver_pattern/strategy/data/respository/quack_behavior_imp/squeak_behavior.dart';

void main() async {
  ///About Singleton Pattern
  print('===============================');
  Singleton x = Singleton.getInstance();
  Singleton y = Singleton.getInstance();
  print('"Singleton Pattern"');
  print('x hash code => ${x.hashCode}');
  print('y hash code => ${y.hashCode}');
  print('===============================');

  ///About Adapter Pattern
  print('===============================');
  print('"Adapter Pattern"');
  SalaryAdepter adepter = SalaryAdepter();
  MachineOperator operator =
      MachineOperator(name: "ahmed", basicSalary: 3000, shiftCode: 000);
  print(
      'Employee Salary after using adapter pattern is ${adepter.calculateBasicSalary(operator)}');
  print('===============================');
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  // Creating ducks with different behaviors
  Duck mallardDuck = Duck(
    flyBehavior: FlyWithWings(),
    quackBehavior: QuackBehaviorRepositoryImp(),
  );
  Duck rubberDuck = Duck(
    flyBehavior: FlyNoWay(),
    quackBehavior: SqueakBehaviorImp(),
  );

  // print("Mallard Duck:");
  // mallardDuck.performFly();
  // mallardDuck.performQuack();
  // mallardDuck.swim();

  // print("\nRubber Duck:");
  // rubberDuck.performFly();
  // rubberDuck.performQuack();
  // rubberDuck.swim();

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GraphQLProvider(
        client: clientNotifier,
        child: const CacheProvider(
          child: MaterialApp(
            home: AnimatedPage(),
          ),
        ),
      ),
    );
  }
}
