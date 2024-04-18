import 'package:animate_do/animate_do.dart';
import 'package:dispill/models/firebase_model.dart';
import 'package:dispill/states/auth_state.dart';
import 'package:dispill/states/device_parameters_state.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/states/settings_state.dart';

import 'package:dispill/utils.dart';
import 'package:dispill/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> weekday = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

List<String> month = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class Homescreen extends StatefulWidget {
  
  

   Homescreen({super.key,});

  @override
  State<Homescreen> createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final String name = FirebaseService().username.toString();
    final DateTime now = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,

      key: _scaffoldKey,
      drawer: myDrawer(context),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(206, 246, 246, 52 / 100),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
            color: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        color: const Color.fromRGBO(206, 246, 246, 52 / 100),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                      0, 3), // Adjust the offset for shadow direction
                )
              ]),
              child: Container(
                height: 92,
                width: width,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(232, 174, 174, 74 / 100),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(
                        text: "Hello $name",
                        fontsize: 20,
                        color: const Color(0xff0E0A56),
                      ),
                      AppText(
                          text:
                              "It's ${weekday[now.weekday - 1]}, ${now.day} ${month[now.month - 1]}",
                          fontsize: 13),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              child: AppText(
                text: "Today's Schedule:",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              child: const HomeNotificationBlock(
                  pillIcon: 'assets/images/pink_pills1.png',
                  tabletDosage: 1,
                  tabletName: 'Paracetamol',
                  beforeFood: false,
                  timeOfDay: 'Morning',
                  timeToTake: TimeOfDay(hour: 8, minute: 00),
                  statusName: 'assets/images/alert1.png'),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: const HomeNotificationBlock(
                tabletName: 'Asprin',
                pillIcon: 'assets/images/blue_pills1.png',
                statusName: 'assets/images/taken1.png',
                tabletDosage: 1,
                beforeFood: false,
                timeOfDay: 'Afternoon',
                timeToTake: TimeOfDay(
                  hour: 12,
                  minute: 30,
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: const HomeNotificationBlock(
                  tabletName: 'Acetaminophen',
                  pillIcon: 'assets/images/pink_pills1.png',
                  statusName: 'assets/images/alert1.png',
                  tabletDosage: 1,
                  beforeFood: false,
                  timeOfDay: 'Night',
                  timeToTake: TimeOfDay(hour: 8, minute: 30)),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 900),
              child: const HomeNotificationBlock(
                  tabletName: 'Amoxicillin',
                  pillIcon: 'assets/images/blue_pills1.png',
                  statusName: 'assets/images/taken1.png',
                  tabletDosage: 1,
                  beforeFood: true,
                  timeOfDay: 'Night',
                  timeToTake: TimeOfDay(hour: 8, minute: 30)),
            ),
          ],
        ),
      )),
    );
  }
}
