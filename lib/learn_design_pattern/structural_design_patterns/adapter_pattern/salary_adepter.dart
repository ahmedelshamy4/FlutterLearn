import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/employee.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/machine_operator.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/salary_calculator.dart';

class SalaryAdepter extends SalaryCalculator {
  late Employee _employee;

  double calculateBasicSalary(MachineOperator operator) {
    _employee =
        Employee(name: operator.name, basicSalary: operator.basicSalary);
    _employee.basicSalary = operator.basicSalary;
    return super.calculateSalary(_employee);
  }
}
