import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/i_builder.dart';

/// Director is responsible for execute builder operations and construct builder object
class Director {
  late IBuilder iBuilder;

  void construct({required IBuilder iBuilder}) {
    this.iBuilder = iBuilder;
    iBuilder.startUpOperations();
    iBuilder.buildBody();
    iBuilder.insertWheels();
    iBuilder.addToHeadLine();
    iBuilder.endOperations();
  }
}