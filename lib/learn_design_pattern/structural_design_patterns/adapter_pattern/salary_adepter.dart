import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/employee_entity.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/machine_operator_entity.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/salary_calculator.dart';

class SalaryAdepter extends SalaryCalculator {
  late EmployeeEntity _employee;

  double calculateBasicSalary(MachineOperatorEntity operator) {
    _employee = EmployeeEntity(
      name: operator.name,
      basicSalary: operator.basicSalary,
    );
    _employee.basicSalary = operator.basicSalary;
    return super.calculateSalary(_employee);
  }
}
