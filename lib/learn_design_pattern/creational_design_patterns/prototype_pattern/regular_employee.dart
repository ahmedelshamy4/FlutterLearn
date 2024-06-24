import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/prototype_pattern/address.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/prototype_pattern/employee_prototype.dart';

class RegEmployee extends EmployeePrototype {
  ///Deep copy clone the object and create the new object with the same data and not the same reference.
  @override
  EmployeePrototype deepCopy() {
    RegEmployee newRegEmployee = RegEmployee();
    // When you assign the newRegEmployee value you can use this.id or id directly.
    newRegEmployee.id = id;
    newRegEmployee.name = name;
    newRegEmployee.address = Address(
      building: address?.building,
      streetName: address?.streetName,
      city: address?.city,
    );
    return newRegEmployee;
  }

  ///Shallow copy clone the object and you can update any data value but any reference data types have the same reference (address) in memory for the two objects.
  @override
  EmployeePrototype shallowCopy() {
    return this;
  }
}
