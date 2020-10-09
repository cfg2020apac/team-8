import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future intialise() async {
    // if (Platform.isIOS) {
    //   // request permission if on adnroid
    //   firebaseMessaging.requestNotificationPermissions(IosNotificationSettings());
    // }

    // firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //   print('onMessage: $message');
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //   print('onMessage: $message');
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //   print('onMessage: $message');
    //   }
    // );

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // _showItemDialog(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
      }
    );

  }

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

}

