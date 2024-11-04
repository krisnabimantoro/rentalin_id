import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Background message handler for Firebase Cloud Messaging
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Message received in background: ${message.notification?.title}');
}

class FirebaseMessagingHandler {
  static const String _channelId = 'progress_channel_id';
  static const String _channelName = 'Progress Notification';
  static const String _channelDesc = 'Notification for progress updates';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'channel_notification',
    'High Importance Notification',
    description: 'Used For Notification',
    importance: Importance.defaultImportance,
  );

  final _localNotification = FlutterLocalNotificationsPlugin();

  /// Initializes push notifications and handles various messaging states.
  Future<void> initPushNotification() async {
    // Request permission for iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    // Fetch the FCM token
    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });

    // Handle messages when the app is in a terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(
            "Message received while app was terminated: ${message.notification?.title}");
      }
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    Future<void> showNotification(
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDesc,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );
      var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.show(
        0, // ID unik untuk notifikasi
        'plain title',
        'plain body',
        platformChannelSpecifics,
        payload: 'plain notification',
      );
    }

    Future<void> showProgressNotification(
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
      var maxProgress = 5; // Jumlah total progres (misal 5 tahap)
      for (var i = 0; i <= maxProgress; i++) {
        await Future.delayed(Duration(seconds: 1), () async {
          var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDesc,
            channelShowBadge: false,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            showProgress: true,
            maxProgress: maxProgress,
            progress: i,
          );
          var platformChannelSpecifics =
              NotificationDetails(android: androidPlatformChannelSpecifics);
          await flutterLocalNotificationsPlugin.show(
            0,
            'progress notification title',
            'progress notification body',
            platformChannelSpecifics,
            payload: 'item x',
          );
        });
      }
    }

    // Handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawable/ic_launcher')),
        payload: jsonEncode(message.toMap()),
      );

      print("Message received in foreground: ${message.notification?.title}");
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('Pesan dibuka dari notifikasi: ${message.notification?.title}');
      });
    });

    // Handle messages when the app is opened from a background state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message opened from background: ${message.notification?.title}");
    });
  }

  Future initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: ios);
    await _localNotification.initialize(settings);
  }
}
