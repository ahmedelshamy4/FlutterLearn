import 'package:flutter/material.dart';
import 'package:flutter_learn/Game/tak_toc_game_page.dart';
import 'package:flutter_learn/core/graph_ql_config.dart';
import 'package:flutter_learn/flutter_animate/animate_page.dart';
import 'package:flutter_learn/google_generative_ai%20/chat_page.dart';
import 'package:flutter_learn/google_generative_ai%20/text_recognition_page.dart';
import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/data/respository/fly_behavior_imp/fly_no_way.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/data/respository/fly_behavior_imp/fly_with_wings_imp.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/data/respository/quack_behavior_imp/quack_behavior_imp.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/domain/duck.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/car_product.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/director.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/i_builder.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/motorcycle_product.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/builder_pattern/product.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/abstract_concrete_factory.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_bank.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/%20abstract_factory_pattern/i_charity.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/anti_pattern.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/concrete_factory.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/factory_pattern/factory_method_pattern/i_product.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/prototype_pattern/address.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/prototype_pattern/employee_prototype.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/prototype_pattern/regular_employee.dart';
import 'package:flutter_learn/learn_design_pattern/creational_design_patterns/singleton_pattern/singleton_pattern.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/%20decorator_pattern/email_notification_service_decorator.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/employee.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/machine_operator.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/salary_adepter.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/adapter_pattern/salary_calculator.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/proxy_pattern/proxy.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/proxy_pattern/sms_service.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/proxy_pattern/sms_service_provider.dart';
import 'package:flutter_learn/shared_preferences/cache_helper.dart';
import 'package:flutter_learn/simple_posts_data_with_clean_arch/ui/post_page.dart';
import 'package:flutter_learn/simple_video/presentaion/video_scrollable_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'learn_design_pattern/behiver_pattern/strategy/data/respository/quack_behavior_imp/squeak_behavior.dart';

void main() async {
  print('design_patterns_with_dart');

  ///About Singleton Pattern
  print('===============================');
  // Singleton x = Singleton.getInstance();
  // Singleton y = Singleton.getInstance();
  // print('"Singleton Pattern"');
  // print('x hash code => ${x.hashCode}');
  // print('y hash code => ${y.hashCode}');
  // print('===============================');
  // print('\n');
  // print('Anti Factory Pattern');
  // AntiPattern antiPattern = AntiPattern();
  // antiPattern.checkProduct();
  //
  // print('\n');
  // print('Factory Method Pattern');
  // ConcreteFactory methodPattern = ConcreteFactory();
  // IProduct? product = methodPattern.createProduct(condition: '123');
  // print(product?.doSomething());
  // print('\n');
  // print('Abstract Factory Pattern');
  // AbstractFactory abstractFactory = AbstractFactory();
  // IBank? bank = abstractFactory.createBank(cardNumber: "cip123");
  // print(bank?.discount());
  // ICharity? charity = abstractFactory.createCharity(inviteCode: '111');
  // print(charity?.fundraising());
  print('===============================');

  ///About Builder Pattern
  print('===============================');
  print('"Builder Pattern"');
  // Director director = Director();
  // IBuilder car = CarProduct(brand: "Jeep");
  // IBuilder motorcycle = MotorcycleProduct(brand: "HONDA");
  // director.construct(iBuilder: car);
  // Product carProduct = car.getProduct();
  // print('Car => ${carProduct.showPart()}');
  //
  // director.construct(iBuilder: motorcycle);
  // Product motorcycleProduct = motorcycle.getProduct();
  // print('Motorcycle => ${motorcycleProduct.showPart()}');
  print('===============================');

  ///About Prototype Pattern
  print('===============================');
  EmployeePrototype prototype1 = RegEmployee();
  prototype1.id = 1;
  prototype1.name = 'Mohamed';
  prototype1.address = Address(
    building: 'building 1',
    streetName: 'streetName 1',
    city: 'city 1',
  );
  EmployeePrototype shallowCopy1 = prototype1.shallowCopy();
  EmployeePrototype deepCopy1 = prototype1.deepCopy();

  print('"Prototype Pattern"');
  print('prototype1 hash code => ${prototype1.hashCode}');
  print('prototype1 shallow copy hash code => ${shallowCopy1.hashCode}');
  print('prototype1 deep copy hash code => ${deepCopy1.hashCode}');

  print('"Prototype Original Values"');
  print('prototype1: \n ${prototype1.toString()}');
  print('prototype1 shallow copy: \n ${shallowCopy1.toString()}');
  print('prototype1 deep copy: \n ${deepCopy1.toString()}');

  shallowCopy1.id = 2;
  shallowCopy1.name = 'Ahmed';
  shallowCopy1.address?.building = 'new building';
  shallowCopy1.address?.streetName = 'new streetName';
  shallowCopy1.address?.city = 'new city';

  print('"Prototype New Values"');
  print('prototype1: \n ${prototype1.toString()}');
  print('prototype1 shallow copy: \n ${shallowCopy1.toString()}');
  print('prototype1 deep copy: \n ${deepCopy1.toString()}');
  print('===============================');

  ///About Adapter Pattern
  // print('===============================');
  // print('"Adapter Pattern"');
  // SalaryAdepter adepter = SalaryAdepter();
  // MachineOperator operator =
  //     MachineOperator(name: "ahmed", basicSalary: 3000, shiftCode: 000);
  // print(
  //     'Employee Salary after using adapter pattern is ${adepter.calculateBasicSalary(operator)}');
  // print('===============================');

  WidgetsFlutterBinding.ensureInitialized();
  await init();

  // Creating ducks with different behaviors
  Duck mallardDuck = Duck(
    flyBehavior: FlyWithWings(),
    quackBehavior: QuackBehaviorRepositoryImp(),
  );
  Duck rubberDuck = Duck(
    flyBehavior: FlyNoWay(),
    quackBehavior: SqueakBehaviorImp(),
  );

  // print("Mallard Duck:");
  // mallardDuck.performFly();
  // mallardDuck.performQuack();
  // mallardDuck.swim();

  // print("\nRubber Duck:");
  // rubberDuck.performFly();
  // rubberDuck.performQuack();
  // rubberDuck.swim();

  ///About Proxy Pattern
  print('===============================');
  print('"Proxy Pattern"');
  //In Proxy we prevent calling sendSms method directly from smsServiceProvider object.
  final SmsService service = SmsServiceProxy();
  for (int i = 0; i < 7; i++) {
    print(service.sendSms(
      clientId: 1,
      mobileNumber: '1111111111111',
      smsMessage: 'Hello, this is a test message! ',
    ));
  }

  ///About Decorator Pattern
  print('===============================');
  print('"Decorator Pattern"');

  SmsService smsServiceProvider = SmsServiceProvider();
  EmailNotificationServiceDetector emailNotificationServiceDetector =
      EmailNotificationServiceDetector();
  emailNotificationServiceDetector.setService(smsServiceProvider);
  print(emailNotificationServiceDetector.sendSms(
      clientId: 1, mobileNumber: '0133333333', smsMessage: 'New Email SMS'));
  print('===============================');
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier(
    GraphQLConfig.client,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GraphQLProvider(
        client: clientNotifier,
        child: const CacheProvider(
          child: MaterialApp(
            home: TextRecognitionPage(),
          ),
        ),
      ),
    );
  }
}
