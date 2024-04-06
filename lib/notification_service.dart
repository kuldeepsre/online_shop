import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initialize() {
    _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: false,
    );

    _firebaseMessaging.getToken().then((token) {
      print(token);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received');
      print(message.notification!.body);
      // Handle foreground messages here
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message opened app');
      // Handle background messages here
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
      print("Handling a background message: ${message.messageId}");
    // Handle background messages for Android and iOS here
  }
}
