import 'package:dispill/auth/auth_screen.dart';
import 'package:dispill/firebase_options.dart';
import 'package:dispill/home/home_screen.dart';
import 'package:dispill/routes.dart';
import 'package:dispill/states/auth_state.dart';
import 'package:dispill/states/device_parameters_state.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/states/settings_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        theme: ThemeData(),
        home: const LandingPage(),
        // initialRoute: 'homeScreen',
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


