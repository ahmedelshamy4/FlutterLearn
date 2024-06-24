import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/bank_cairo.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/bank_cip.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/charity_a.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/charity_b.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_bank.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_charity.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/iabstract_factory_method.dart';

class AbstractFactory implements IAbstractFactory {
  @override
  IBank? createBank({required cardNumber}) {
    switch (cardNumber) {
      case 'cip123':
        return BankCip();
      case 'cairo111':
        return BankCairo();
      default:
        return null;
    }
  }

  @override
  ICharity? createCharity({required inviteCode}) {
    switch (inviteCode) {
      case '123':
        return CharityA();
      case '111':
        return CharityB();
      default:
        return null;
    }
  }
}
