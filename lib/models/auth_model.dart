import 'package:dispill/models/firebase_model.dart';
import 'package:dispill/states/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Function for user registration with email and password
  Future<bool> registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, the user is registered and logged in
      print('Registration Successful!');
      return true;

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
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    } finally {
      await FirebaseService().onUserLoginOrRegister();

      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil("/welcomeScreen", (route) => false);
    }
  }

  Future<bool> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successful, the user is now logged in

       await FirebaseService().onUserLoginOrRegister();
      return true;
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
      return false;
    } catch (e) {
      return false;

      // Handle any other exceptions
    } finally {
      

      }
     
    
  }

  // Function to sign out the current user
  Future<bool> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      await FirebaseService().onUserLoginOrRegister();
    }
  }
}
