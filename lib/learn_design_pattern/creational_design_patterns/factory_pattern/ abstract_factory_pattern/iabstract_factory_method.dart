import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_bank.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_charity.dart';

abstract class IAbstractFactory {
  IBank? createBank({required cardNumber});

  ICharity? createCharity({required inviteCode});
}
