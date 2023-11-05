import 'package:dispill/home/home_screen.dart';
import 'package:dispill/registeration/connect_device.dart';
import 'package:dispill/registeration/loading_screen.dart';
import 'package:dispill/registeration/tablet_verification.dart';
import 'package:dispill/registeration/upload_prescription.dart';
import 'package:dispill/registeration/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: WelcomeScreen(),
      routes: {
        '/welcomeScreen': (context) => const WelcomeScreen(),
        '/connectDevice': (context) => const ConnectDeviceScreen(),
        '/prescriptionScreen': (context) => const PrescriptionScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/completed': (context) => const CompletedScreen(),
        '/tabletVerification': (context) => const TabletVerification(),
        '/homeScreen': (context) => const Homescreen(),
      },
    );
  }
}
