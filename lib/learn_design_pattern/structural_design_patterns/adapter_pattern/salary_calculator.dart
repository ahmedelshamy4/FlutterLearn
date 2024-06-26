import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/employee_entity.dart';

///This class is responsible for calculate salary from Employee object

class SalaryCalculator {
  double calculateSalary(EmployeeEntity employee) => employee.basicSalary * 1.5;
}
