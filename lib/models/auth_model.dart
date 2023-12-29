import 'package:dispill/models/firebase_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Function for user registration with email and password
  Future<void> registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, the user is registered and logged in
      print('Registration Successful!');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          print('The password provided is too weak.');
          break;
        case 'email-already-in-use':
          print('The account already exists for that email.');
          break;
        case 'invalid-email':
          print('The email address is invalid.');
          break;
        default:
          print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      await FirebaseService().onUserLoginOrRegister();

      Navigator.of(context)
          .pushNamedAndRemoveUntil("/welcomeScreen", (route) => false);
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, the user is now logged in
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        // Handle invalid email
      } else if (e.code == 'user-not-found') {
        // Handle user not found
      } else if (e.code == 'wrong-password') {
        // Handle wrong password
      } else {
        // Handle other exceptions
      }
    } catch (e) {
      // Handle any other exceptions
    } finally {
      await FirebaseService().onUserLoginOrRegister();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/homeScreen', (route) => false);
    }
  }

  // Function to sign out the current user
  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e);
    } finally {
      await FirebaseService().onUserLoginOrRegister();

      Navigator.of(context).pushNamed('/loginScreen');
    }
  }
}
