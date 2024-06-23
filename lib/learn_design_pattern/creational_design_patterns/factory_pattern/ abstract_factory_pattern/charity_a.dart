import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_charity.dart';

class CharityA implements ICharity {
  @override
  String fundraising() {
    return 'This is the charity A';
  }
}
