import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/product.dart';

abstract class IBuilder {
  void startUpOperations();

  void buildBody();

  void insertWheels();

  void addToHeadLine();

  void endOperations();

  Product getProduct();
}
