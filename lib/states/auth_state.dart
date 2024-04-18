import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthStateProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  AuthStateProvider() {
    checkAuthStatus();
  }

  void setAuthenticated(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }

  void checkAuthStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isAuthenticated = false;
        print("my State: $isAuthenticated");
        notifyListeners();
      } else {
        isAuthenticated = true;
        notifyListeners();
      }
    });
  }
}
