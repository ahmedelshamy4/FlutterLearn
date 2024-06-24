import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/i_builder.dart';
import 'product.dart';

class MotorcycleProduct implements IBuilder {
  final String brand;

  MotorcycleProduct({required this.brand});

  Product product = Product();

  @override
  void startUpOperations() {
    product.addPart(part: 'Motorcycle mode is: $brand');
  }

  @override
  void buildBody() {
    product.addPart(part: 'Motorcycle body was added');
  }

  @override
  void insertWheels() {
    product.addPart(part: 'Motorcycle wheels was inserted');
  }

  @override
  void addToHeadLine() {
    product.addPart(part: 'Add motorcycle to headline');
  }

  @override
  void endOperations() {
    product.addPart(part: 'End of motorcycle operations');
  }

  @override
  Product getProduct() {
    return product;
  }
}
