import 'dart:convert';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'api_handler.dart';

class PushNotificationService {
  static final FirebaseMessaging _fcm = FirebaseMessaging();
  static final String serverToken =
      'AAAAZ7io_fI:APA91bGvXA8xT_46YrgJctmkvP7uo3epX6RV40YNImsbENZ8oqV3RC9n8QIkVIW9UO2SKLjlduYEnNSCNHt5i593TJR25gnaRK02YwZ6qLuLQG7KWwVv7WoKjn3Kk3YiVKNvNYTaMu4A';

  //
  static Future<Map<String, dynamic>> sendAndRetrieveMessage(
      String token, String title, String content) async {
    await _fcm.requestNotificationPermissions(
      const IosNotificationSettings(
          sound: true, badge: true, alert: true, provisional: false),
    );
    http.Response res = await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': '$content',
            'title': '$title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': '$token',
        },
      ),
    );
    print(token);
    print(res);
  }

  //update token when login on new device
  static Future<String> updateToken(String email, String token) async {
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      String body = jsonEncode(
          <String, String>{"email": '$email', "deviceToken": '$token'});
      http.Response response =
          await http.put(ApiHandler.NOTIFY, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("OKKKKKKKKKKKk");
        return "OK";
      } else {
        print("WRONG");
        return "ERROR";
      }
    } catch (e) {
      print("ERRRR=" + e);
    }
  }

  static Future<void> pushNotification(String total) async {
    try {
      print(total);
      //get list token
      Map<String, String> headers = {"Content-type": "application/json"};
      http.Response response =
          await http.get(ApiHandler.NOTIFY, headers: headers);
      var model = jsonDecode(response.body);
      for (Object token in model) {
        //check token
        if (token != null && token.toString().trim().length != 0) {
          //push notify
          print(token);
          await sendAndRetrieveMessage(token.toString(), "BobaHub Notification",
              "Get a order \nTotal: $total");
        }
      }
    } catch (e) {
      print("ERRRR=" + e);
    }
  }
}
