import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_bank.dart';

class BankCip implements IBank {
  @override
  String discount() {
    return 'This is the CIP BANK';
  }
}
