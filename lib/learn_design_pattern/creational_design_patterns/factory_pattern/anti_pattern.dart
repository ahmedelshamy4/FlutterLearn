import 'dart:io';

import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/product_a.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/product_b.dart';

///This is the anti pattern from (Factory Pattern) because all logic to get the purpose product is done on client.
class AntiPattern {
  final ProductA productA = ProductA();
  final ProductB productB = ProductB();
  late String condition;

  void checkProduct() {
    print('Enter your condition here: ');
    condition = stdin.readLineSync()!.substring(0, 3);
    switch (condition) {
      case '123':
        print(productA.doSomething());
      case '111':
        print(productB.doSomething());
      default:
        print('null');
    }
  }
}
