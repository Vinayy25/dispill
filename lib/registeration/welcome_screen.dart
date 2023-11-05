import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            top: height * 0.18,
            left: width * 0.2,
            child: const Column(
              children: [
                AppLargeText(
                  text: "welcome!!",
                  fontWeight: FontWeight.w900,
                  fontsize: 22,
                ),
                SizedBox(
                  height: 10,
                ),
                AppText(
                  text: 'will remind you about your medications.',
                  fontWeight: FontWeight.w500,
                  fontsize: 13,
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.3,
            left: width * 0.11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CurvedTextFields(
                  keyboardType: TextInputType.name,
                  height: 49,
                  width: 286,
                  hintText: 'enter your full name',
                  radius: 25,
                ),
                const SizedBox(
                  height: 60,
                ),
                const AppLargeText(
                  text: 'Select the gender:',
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 58,
                          backgroundColor: Colors.transparent,
                          foregroundImage:
                              AssetImage('assets/images/male_avatar.png'),
                        ),
                        AppLargeText(
                          text: "male",
                          fontsize: 15,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.transparent,
                          foregroundImage:
                              AssetImage('assets/images/female_avatar.png'),
                        ),
                        AppLargeText(text: "female", fontsize: 15),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                const Row(
                  children: [
                    AppLargeText(
                      text: 'Select your age:',
                      fontsize: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CurvedTextFields(
                      keyboardType: TextInputType.number,
                      height: 28,
                      width: 85,
                      radius: 25,
                      hintText: "age",
                      paddingB: 0,
                      paddingL: 20,
                      paddingR: 0,
                      paddingT: 0,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/connectDevice', (route) => false);
                  },
                  child: Container(
                    height: 70,
                    width: 297,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: const Color(0xff2DA39B),
                    ),
                    child: const Center(
                      child: AppText(
                        text: "LET'S GET STARTED!!",
                        color: Colors.white,
                        fontsize: 20,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
