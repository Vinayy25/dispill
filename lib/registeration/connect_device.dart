import 'dart:async';

import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class ConnectDeviceScreen extends StatefulWidget {
  const ConnectDeviceScreen({super.key});

  @override
  State<ConnectDeviceScreen> createState() => _ConnectDeviceScreenState();
}

class _ConnectDeviceScreenState extends State<ConnectDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(clipBehavior: Clip.none, children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top_bubble_design.png',
            ),
          ),
          Positioned(
              top: height * 0.22,
              left: width * 0.2,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Let's get connected to your device!!",
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AppText(
                    text: "Scan the QR code:",
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              )),
          Positioned(
            top: height * 0.35,
            left: width * 0.25,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/loading');

                // Start a timer.
                Timer(const Duration(seconds: 1), () {
                  Navigator.of(context).pushNamed('/completed');

                  // Navigate to the next screen.
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/prescriptionScreen', (route) => false);
                });
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(31),
                    border: Border.all(color: Colors.black, width: 4)),
                height: 185,
                width: 185,
                child: Image.asset(
                  'assets/images/qrcode_vector.png',
                  scale: 4,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 216,
              width: 192,
              child: Image.asset('assets/images/qrcode_mobile_vector.png'),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/bottom_bubble_design.png',
            ),
          ),
        ]),
      ),
    );
  }
}
