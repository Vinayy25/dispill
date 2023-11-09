import 'package:animate_do/animate_do.dart';
import 'package:dispill/auth/auth_model.dart';
import 'package:dispill/colors.dart';
import 'package:dispill/home/edit_prescription.dart';
import 'package:dispill/registeration/upload_prescription.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(219, 251, 251, 1),
      key: _scaffoldKey,
      drawer: myDrawer(context),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(
                      text: 'Hello USER!',
                      fontsize: 20,
                      color: Color(0xff0E0A56),
                    ),
                    AppText(text: "It's Thursday, 18th June", fontsize: 13),
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
          )
        ],
      )),
    );
  }
}

class HomeNotificationBlock extends StatelessWidget {
  final String pillIcon;
  final String statusName;

  final String tabletName;

  final double tabletDosage;
  final bool beforeFood;
  final String timeOfDay;
  final TimeOfDay timeToTake;

  const HomeNotificationBlock({
    super.key,
    required this.tabletName,
    required this.pillIcon,
    required this.statusName,
    required this.tabletDosage,
    required this.beforeFood,
    required this.timeOfDay,
    required this.timeToTake,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 50, bottom: 20),
      height: 72,
      width: 280,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 3.0,
          spreadRadius: 1.0,
          offset: const Offset(0, 3), // Adjust the offset for shadow direction
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            pillIcon,
            fit: BoxFit.contain,
            height: 25,
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 5,
              ),
              AppLargeText(
                text: tabletName,
                fontsize: 16,
                fontWeight: FontWeight.w700,
              ),
              AppText(
                  fontWeight: FontWeight.w100,
                  color: Colors.black38,
                  fontsize: 12,
                  text:
                      '${tabletDosage.toInt()} tablet ${tabletDosage > 1 ? 's' : ''}/${beforeFood ? 'before meal' : 'after meal'}'),
              Row(
                children: [
                  AppText(
                    text: timeOfDay,
                    color: const Color(0xff28AA93),
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AppText(
                    text:
                        "${timeToTake.hour}${timeToTake.minute > 0 ? ':${timeToTake.minute}' : ''} ${timeToTake.period.toString().substring(10, 12).toUpperCase()}",
                    color: const Color(0xff28AA93),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
          Image.asset(
            statusName,
            fit: BoxFit.contain,
            height: 38,
            width: 28,
          )
        ],
      ),
    );
  }
}

Widget emptyGreyContainer(String time) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: AppLargeText(
          text: time,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, top: 10),
        height: 52,
        width: 279,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffD9D9D9)),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, top: 10),
        height: 52,
        width: 279,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffD9D9D9)),
      ),
    ],
  );
}

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: tertiaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLargeText(
                text: 'Pill Reminder',
                fontsize: 17.6,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/homeScreen'),
          child: const DrawerContainer(
              text: "Home",
              leading: Icon(Icons.home, color: Colors.black),
              route: ''),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.of(context).push(_createRouteForEditPrescription()),
          child: const DrawerContainer(
              text: "Edit Prescription",
              leading: ImageIcon(AssetImage('assets/images/pills.png')),
              route: ''),
        ),
        const DrawerContainer(
            text: "Check History",
            leading: Icon(Icons.history, color: Colors.black),
            route: ''),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/settings');
          },
          child: const DrawerContainer(
              text: "Settings",
              leading: Icon(Icons.settings, color: Colors.black),
              route: ''),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20, left: 5, right: 5),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        const DrawerContainer(
            text: "Manage Device",
            leading: Icon(Icons.phone_android),
            route: ''),
        const DrawerContainer(
            text: "Contact",
            leading: Icon(Icons.contact_phone_rounded),
            route: ''),
        const DrawerContainer(
            text: "Customer support",
            leading: Icon(Icons.support_agent_rounded),
            route: ''),
        GestureDetector(
          onTap: () => AuthService().signOut(context),
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 100),
            height: 52,
            width: 235,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(45, 163, 155, 73 / 100),
                borderRadius: BorderRadius.circular(11)),
            child: const Center(
              child: AppLargeText(
                text: 'Log out',
                fontsize: 23,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Route _createRouteForEditPrescription() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const EditPrescriptionScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1);
      var end = Offset.zero;
      var curve = Curves.decelerate;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
