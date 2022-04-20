import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/data/local_storage.dart';

// TODO(anyone): xin provision certificate từ Linhlc test ios notification env release

// It must not be an anonymous function.
// It must be a top-level function.
// see https://firebase.flutter.dev/docs/messaging/usage#background-messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message: ${message.data}');
  // for example handle update badge for android
  NotificationUtil._updateBadgeCount(message);
}

// To show data message type in background mode
// On Android, set the priority field to high.
// On Apple (iOS & macOS), set the content-available field to true.
// Note: this still does not guarantee delivery.
// see https://firebase.flutter.dev/docs/messaging/usage#message-types
// and firebase.flutter.dev/docs/messaging/usage#low-priority-messages

// TODO(anyone): integrate firebase with APNs apple
// see: https://firebase.flutter.dev/docs/messaging/apple-integration/
class NotificationUtil {
  NotificationUtil._();

  static const channelId = 'channelId';
  static const channelName = 'channelName';
  static const localNotifyID = 0;
  static final messaging = FirebaseMessaging.instance;

  // Initalize the [FlutterLocalNotificationsPlugin] package.
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize(BuildContext context) async {
    final token = await messaging.getToken();
    log('Notification token: $token');
    final initialMsg = await messaging.getInitialMessage();

    if (initialMsg != null) {
      await _showScreensByMessage(context, initialMsg);
    }
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _onMessage(context);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _showScreensByMessage(context, message, onLaunch: true);
    });

    await _initializeLocalNotification(context);
  }

  static Future<void> _initializeLocalNotification(BuildContext context) async {
    // initialise the plugin. ic_notification needs to be a added as a drawable resource to the Android head project
    // see more: https://developer.android.com/studio/write/image-asset-studio#create-notification
    const settingsAndroid = AndroidInitializationSettings('ic_notification');

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // if you want to request permissions at a later point in your application on iOS,
    // set the first 3 properties to false
    // then call the requestPermissions method with desired permissions
    // at the appropriate point in your application
    // see https://pub.dev/packages/flutter_local_notifications#ios-all-supported-versions-and-macos-1014-requesting-notification-permissions
    const settingsIOS = IOSInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: settingsAndroid,
      iOS: settingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payloadString) async {
        try {
          final payload =
              jsonDecode(payloadString ?? '') as Map<String, dynamic>;
          await _showScreens(context, payload);
        } on Exception catch (e, trace) {
          await FirebaseCrashlytics.instance.recordError(e, trace);
        }

        return;
      },
    );
  }

  // only for ios/ mac os
  static Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      return;
    }
    final settings = await FirebaseMessaging.instance.requestPermission(
      sound: true,
      badge: true,
      alert: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');
  }

  static Future<void> _onMessage(BuildContext context) async {
    const channel = AndroidNotificationChannel(
      channelId,
      channelName,
      importance:
          Importance.high, // Required to display a heads up notification
      ledColor: AppStyles.primaryColor,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // handle when has new notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null) {
        final platformChannelSpecifics = NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            color: channel.ledColor,
          ),
        );

        // show local notification or head-up
        await flutterLocalNotificationsPlugin.show(
          localNotifyID,
          notification.title,
          notification.body,
          platformChannelSpecifics,
          payload: jsonEncode(message.data),
        );

        // handle something else for example update badge icon android
        NotificationUtil._updateBadgeCount(message);
      }
    });
  }

  // you need update device token if use amazon SNS
  // when platform endpoint is deactivated
  static Future<void> updateFcmTokenIfRequired({
    String? fcmToken,
  }) async {
    final newFcmToken = fcmToken ?? await messaging.getToken();
    final userInfo = await LocalStorage.loadUserInfo();
    final currentFcmToken = userInfo.fcmToken;

    if (newFcmToken == currentFcmToken) {
      return;
    }

    if (newFcmToken == null) {
      return;
    }

    // call API update device token to amazone SNS
  }

  static Future<void> _showScreensByMessage(
    BuildContext context,
    RemoteMessage message, {
    bool onLaunch = false,
  }) async {
    try {
      final data = message.data;
      await _showScreens(context, data, onLaunch: onLaunch);
    } on Exception catch (e, trace) {
      await FirebaseCrashlytics.instance.recordError(e, trace);
    }
  }

  static Future<void> _showScreens(
    BuildContext context,
    Map<String, dynamic> payload, {
    bool onLaunch = false,
  }) async {
    const topicKey = 'topic_id';
    const noticeKey = 'topic_id';

    if (payload.containsKey(topicKey)) {
      final topicId = (payload[topicKey] ?? '').toString();

      if (topicId.isEmpty) {
        return;
      }

      // push to target screen

      return;
    }

    // if need handle other case
    if (payload.containsKey(noticeKey)) {
      final noticeId = (payload[noticeKey] ?? '').toString();

      if (noticeId.isEmpty) {
        return;
      }

      // push to target screen

      return;
    }
  }

  static void _updateBadgeCount(RemoteMessage message) {
    if (Platform.isIOS) {
      // ios automatic update badge icon through APNs
      // you need return
      return;
    }

    final badgeStr = (message.data['badge'] ?? '').toString();
    // ignore: unused_local_variable
    final badgeCount = int.tryParse(badgeStr) ?? 0;

    // update flutter app badge icon for this session by using badgeCount
  }
}
