import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/proxy_pattern/sms_service.dart';

/// Decorator pattern is one of the solutions to apply the (Open Closed) principle.

abstract class SmsServiceIDecorator extends SmsService {
  SmsService? smsService;

  void setService(SmsService service) {
    smsService = service;
  }

  @override
  String sendSms(
      {required int clientId,
      required String mobileNumber,
      required String smsMessage}) {
    if (smsService != null) {
      return smsService!.sendSms(
          clientId: clientId,
          mobileNumber: mobileNumber,
          smsMessage: smsMessage);
    } else {
      return 'Notification service is not initialized';
    }
  }
}
