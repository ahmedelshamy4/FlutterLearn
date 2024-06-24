import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/i_product.dart';

class ProductA implements IProduct {
  @override
  String doSomething() {
    return 'This is Product from type (A)';
  }
}
