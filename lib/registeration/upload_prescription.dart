import 'dart:async';

import 'package:dispill/colors.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen1 extends StatelessWidget {
  const PrescriptionScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffEEF3F3),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/images/top_bubble_design.png',
                ),
              ),
              Positioned(
                  top: height * 0.3,
                  left: width * 0.1,
                  child: const AppLargeText(
                    text: "Upload the prescription:",
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Positioned(
                top: height * 0.35,
                left: width * 0.28,
                child: Column(
                  children: [
                    Container(
                      height: 223,
                      width: 165,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: Colors.black, width: 4)),
                      child: Image.asset(
                        'assets/images/prescription_skeleton.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/loading', (route) => false);
                              },
                              icon: const Icon(Icons.camera_alt)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.photo_library)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/bottom_bubble_design.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
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
            ),
          ),
          Positioned(
              top: height * 0.25,
              left: width * 0.1,
              child: const AppLargeText(
                text: "Upload the prescription:",
                fontsize: 20,
                fontWeight: FontWeight.bold,
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_bubble_design.png',
            ),
          ),
          Positioned(
            top: height * 0.3,
            left: width * 0.2,
            child: Column(
              children: [
                Container(
                  height: 223,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child: Image.asset('assets/images/prescription_skeleton.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.photo_library),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 36,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff2DA39B)),
                  child: const Center(
                    child: AppLargeText(
                      text: 'Enter Manually',
                      fontsize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/loading');

                    Timer(Duration(seconds: 1), () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/tabletVerification', (route) => false);
                    });
                  },
                  child: Container(
                    height: 52,
                    width: 235,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: const Color(0xff2DA39B)),
                    child: const Center(
                      child: AppLargeText(
                        text: 'PROCEED',
                        fontsize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class DrawerContainer extends StatelessWidget {
  final String text;
  final Widget leading;
  final String route;

  const DrawerContainer({
    super.key,
    required this.text,
    required this.leading,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      height: 52,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          leading,
          const SizedBox(width: 25),
          AppText(text: text, fontsize: 17, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
