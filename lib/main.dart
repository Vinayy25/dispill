import 'package:dispill/auth/auth_screen.dart';
import 'package:dispill/firebase_options.dart';
import 'package:dispill/home/home_screen.dart';
import 'package:dispill/registeration/loading_screen.dart';
import 'package:dispill/routes.dart';
import 'package:dispill/states/device_parameters_state.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/states/settings_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// Dummy data for USER class

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeviceParametersProvider(),
        ),
        ChangeNotifierProvider(
          
          create: (context) => PrescriptionStateProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dispill',
        theme: ThemeData(),
        home: const AuthenticationWrapper(),
        routes: routes,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen(); // Show a loading screen while checking auth status
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            return const Homescreen(); // User is logged in, show WelcomeScreen
          } else {
            return const LoginScreen(); // User is not logged in, show AuthScreen (Login/Register)
          }
        }
      },
    );
  }
}
