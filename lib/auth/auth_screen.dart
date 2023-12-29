import 'package:dispill/models/auth_model.dart';
// Example for your custom text widget
import 'package:dispill/utils.dart'; // Import your custom utility functions or widgets
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final AuthService authService = AuthService();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top_bubble_design.png',
              ),
            ),
            Positioned(
              top: 210,
              child: Column(
                children: [
                  const AppLargeText(text: 'Login to Dispill'),
                  const SizedBox(
                    height: 30,
                  ),
                  CurvedTextFields(
                    controller: emailController,
                    height: 50,
                    width: 250,
                    radius: 20,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CurvedTextFields(
                    controller: passwordController,
                    height: 50,
                    width: 250,
                    radius: 20,
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Check if email and password are not empty before calling the signInWithEmailAndPassword method

                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        await authService.signInWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                            context);

                        // Handle the response as needed
                      }
                    },
                    child: myButton(context, 'Login', 20, 200, 50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/registrationScreen'),
                    child: const AppText(
                      text: 'Click here to Register',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final AuthService authService = AuthService();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top_bubble_design.png',
              ),
            ),
            Positioned(
              top: 210,
              child: Column(
                children: [
                  const AppLargeText(text: 'Register on Dispill'),
                  const SizedBox(
                    height: 30,
                  ),
                  CurvedTextFields(
                    controller: emailController,
                    height: 50,
                    width: 250,
                    radius: 20,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CurvedTextFields(
                    controller: passwordController,
                    height: 50,
                    width: 250,
                    radius: 20,
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Check if email and password are not empty before calling the signInWithEmailAndPassword method
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        authService.registerWithEmailAndPassword(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                            context);
                      }
                    },
                    child: myButton(context, 'Register', 20, 200, 50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/loginScreen'),
                    child: const AppText(
                      text: 'Click here to Login',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
