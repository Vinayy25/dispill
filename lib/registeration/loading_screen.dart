import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top_bubble_design.png',
              )),
          Positioned(
              top: height * 0.22,
              left: width * 0.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/images/loading_avatar.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/completed', (route) => false);
                    },
                    child: const AppText(
                      text: "Loading...",
                      fontsize: 20,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bottom_bubble_design.png',
              )),
        ],
      )),
    );
  }
}

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top_bubble_design.png',
              )),
          Positioned(
              top: height * 0.22,
              left: width * 0.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/images/completed_avatar.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/prescriptionScreen', (route) => false);
                    },
                    child: const AppText(
                      text: "Completed!!",
                      fontsize: 20,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bottom_bubble_design.png',
              )),
        ],
      )),
    );
  }
}
