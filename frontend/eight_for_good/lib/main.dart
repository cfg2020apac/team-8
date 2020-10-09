import 'package:eight_for_good/push_notification_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
void main() {
  runApp(MyApp());
    // Replace with server token from firebase console settings.
final String serverToken = 'AAAAwGjrK2s:APA91bG-clD0bvUwEny1r9r7RtBtqC0ZkFKiXjyA469m2sL6t9RGKjVqc_mQ0wkrOa_WN-mZZNwfoqGOWriGkH3YUheJEk0gaE-2rLpw16N1SaIy-QxRYQr2UQxqHyqB1Sez1O4Z5DBP';
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
  }

Future<Map<String, dynamic>> sendAndRetrieveMessage() async {
  await firebaseMessaging.requestNotificationPermissions(
    // const IosNotificationSettings(sound: true, badge: true, alert: true, provisional: false),
  );

  await http.post(
    'https://fcm.googleapis.com/fcm/send',
     headers: <String, String>{
       'Content-Type': 'application/json',
       'Authorization': 'key=$serverToken',
     },
     body: jsonEncode(
     <String, dynamic>{
       'notification': <String, dynamic>{
         'body': 'this is a body',
         'title': 'this is a title'
       },
       'priority': 'high',
       'data': <String, dynamic>{
         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
         'id': '1',
         'status': 'done'
       },
       'to': await firebaseMessaging.getToken(),
     },
    ),
  );

  final Completer<Map<String, dynamic>> completer =
     Completer<Map<String, dynamic>>();

  firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      completer.complete(message);
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      completer.complete(message);
    },
    onResume: (Map<String, dynamic> message) async {
      completer.complete(message);
    },
  );
  print("this function is reached");

  return completer.future;
}

sendAndRetrieveMessage();

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}
