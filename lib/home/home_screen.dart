import 'package:dispill/colors.dart';
import 'package:dispill/home/edit_prescription.dart';
import 'package:dispill/registeration/upload_prescription.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key});

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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -55,
                left: 0,
                child: Container(
                  height: 260,
                  width: width,
                  decoration: BoxDecoration(color: primaryColor),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 62,
                          backgroundColor: Colors.transparent,
                          foregroundImage:
                              AssetImage('assets/images/female_avatar.png'),
                        ),
                        AppText(
                          text: 'Hello there!!',
                          fontsize: 13,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )),
                )),
            Positioned(
              top:
                  -55, // Adjust as needed for the desired position behind the appbar
              left: 0,
              child: Image.asset('assets/images/top_bubble_design.png'),
            ),
            // Other widgets for your main content go here
          ],
        ),
      ),
    );
  }
}

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: tertiaryColor,
          ),
          child: const Column(
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
        const DrawerContainer(
            text: "Home",
            leading: Icon(Icons.home, color: Colors.black),
            route: ''),
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
        const DrawerContainer(
            text: "Settings",
            leading: Icon(Icons.settings, color: Colors.black),
            route: ''),
        const Padding(
          padding:
              const EdgeInsets.only(top: 20.0, bottom: 20, left: 5, right: 5),
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
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 100),
          height: 52,
          width: 235,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(11)),
          child: const Center(
            child: AppLargeText(
              text: 'Log out',
              fontsize: 23,
              color: Colors.white,
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
