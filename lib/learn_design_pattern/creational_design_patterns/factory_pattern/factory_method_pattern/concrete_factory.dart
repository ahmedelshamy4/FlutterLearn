import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/i_product.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/iabstract_factory_method.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/product_a.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/product_b.dart';

class ConcreteFactory implements IFactoryMethod {
  @override
  IProduct? createProduct({required String condition}) {
    switch (condition) {
      case "123":
        return ProductA();
      case "111":
        return ProductB();
      default:
        return null;
    }
  }
}
