import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/proxy_pattern/sms_service.dart';
import 'package:flutter_learn/learn_design_pattern/structural_design_patterns/proxy_pattern/sms_service_provider.dart';

///The Proxy is a placeholder for anther object to control access to it.
///"like get a way for an object".
///We want to create service about send sms message but if client call this service more than 5 times don't send sms.
class Proxy {
  SmsService? _smsService;

  final Map<String, dynamic> clientSmsCount = {};

  String sendSms({
    required int clientId,
    required String mobileNumber,
    required String smsMessage,
  }) {
    //Lazy initialization
    _smsService ??= SmsServiceProvider();

    //First call to sms
    // print(clientSmsCount['$clientId'] > 5);
    if (!clientSmsCount.containsKey('$clientId')) {
      clientSmsCount['$clientId'] = 1;
      return _smsService!.sendSms(
          clientId: clientId,
          mobileNumber: mobileNumber,
          smsMessage: smsMessage);
    }
    //Second call to sms
    else {
      if (clientSmsCount['$clientId'] >= 5) {
        return 'Don\'t send sms because your quota is over';
      } else {
        clientSmsCount['$clientId'] = clientSmsCount['$clientId'] + 1;
        return _smsService!.sendSms(
            clientId: clientId,
            mobileNumber: mobileNumber,
            smsMessage: smsMessage);
      }
    }
  }
}

class SmsServiceProxy implements SmsService {
  SmsService? _smsService;
  final Map<int, int> _clientSmsCount = {};

  @override
  String sendSms(
      {required int clientId,
      required String mobileNumber,
      required String smsMessage}) {
    // Lazy initialization of the real service
    _smsService ??= SmsServiceProvider();
    // Initialize client SMS count if not already present
    if (!_clientSmsCount.containsKey(clientId)) {
      _clientSmsCount[clientId] = 0;
    }
    // Check if the client has exceeded the SMS limit
    if (_clientSmsCount[clientId]! >= 5) {
      return 'Don\'t send SMS because your quota is over';
    } else {
      // Increment the SMS count for the client
      _clientSmsCount[clientId] = _clientSmsCount[clientId]! + 1;
      return _smsService!.sendSms(
        clientId: clientId,
        mobileNumber: mobileNumber,
        smsMessage: smsMessage,
      );
    }
  }
}
