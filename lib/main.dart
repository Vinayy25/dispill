import 'package:dispill/auth/auth_screen.dart';
import 'package:dispill/firebase_options.dart';
import 'package:dispill/home/home_screen.dart';
import 'package:dispill/routes.dart';
import 'package:dispill/states/auth_state.dart';
import 'package:dispill/states/device_parameters_state.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/states/settings_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Subscribe to 'news' topic
  FirebaseMessaging.instance.subscribeToTopic('news');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    _showNotification(message);
  });

  runApp(const MyApp());
}

void _showNotification(RemoteMessage message) async {
  final notification = message.notification;
  final androidNotification = message.notification?.android;

  if (notification != null && androidNotification != null) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'DISPILL',
      'News Notifications',
      channelDescription: 'Notifications related to news updates',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      notification.title ?? 'No Title',
      notification.body ?? 'No Body',
      platformChannelSpecifics,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AuthStateProvider();
        }),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeviceParametersProvider(),
        ),
        ChangeNotifierProvider(create: (context) {
          return PrescriptionStateProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dispill',
        theme: ThemeData(
          fontFamily: 'roboto',
        ),
        home: const LandingPage(),
        routes: routes,
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateProvider>(
      builder: (context, provider, child) {
        return provider.isAuthenticated == true
            ? Homescreen()
            : const LoginScreen();
      },
    );
  }
}
