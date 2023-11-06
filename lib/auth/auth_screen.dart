import 'package:animate_do/animate_do.dart';
import 'package:dispill/auth/auth_model.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Image.asset(
                'assets/images/top_bubble_design.png',
              ),
              top: 0,
              left: 0,
            ),
            Positioned(
              top: 210,
              child: Column(
                children: [
                  AppLargeText(text: 'Login to Dispill'),
                  SizedBox(
                    height: 30,
                  ),
                  CurvedTextFields(
                      height: 50,
                      width: 250,
                      radius: 20,
                      hintText: "enter your email",
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 20,
                  ),
                  CurvedTextFields(
                      height: 50,
                      width: 250,
                      radius: 20,
                      hintText: "password",
                      keyboardType: TextInputType.visiblePassword),
                  SizedBox(
                    height: 20,
                  ),
                  MyButton(context, 'Login', 20, 200, 50)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
