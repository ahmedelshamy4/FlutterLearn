import 'employee.dart';

///This class is responsible for calculate salary from Employee object

class SalaryCalculator {
  double calculateSalary(Employee employee) => employee.basicSalary * 1.5;
}
