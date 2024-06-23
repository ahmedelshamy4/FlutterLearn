abstract class SmsService {
  String sendSms({
    required int clientId,
    required String mobileNumber,
    required String smsMessage,
  });
}
