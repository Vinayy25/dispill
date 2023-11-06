import 'package:dispill/auth/auth_screen.dart';
import 'package:dispill/firebase_options.dart';

import 'package:dispill/registeration/welcome_screen.dart';
import 'package:dispill/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

List<String> assetImages = [
  'assets/images/top_bubble_design.png',
  'assets/images/bottom_bubble_design.png',
  'assets/images/female_avatar.png',
  'assets/images/male_avatar.png',
  'assets/images/loading_avatar.png',
  'assets/images/completed_avatar.png',
  'assets/images/qrcode_moblie_vector.png',
  'assets/images/qrcode_vector.png',
  'assets/images/prescription_skeleton.png',
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const WelcomeScreen(),
      routes: routes,
    );
  }
}
