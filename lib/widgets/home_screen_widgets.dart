import 'package:dispill/home/check_history.dart';
import 'package:dispill/models/auth_model.dart';
import 'package:dispill/colors.dart';
import 'package:dispill/home/edit_prescription.dart';
import 'package:dispill/registeration/upload_prescription.dart';
import 'package:dispill/states/device_parameters_state.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/states/settings_state.dart';
import 'package:dispill/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        
        Consumer<PrescriptionStateProvider>(builder: (context, provider, child){ return  GestureDetector(
          onTap: () {
              provider.fetchPrescription();
              provider.fetchFreeslots();
              provider.fetchStoreDetails();
              Navigator.of(context).push(_createRouteForEditPrescription());


          },
          child: const DrawerContainer(
              text: "Edit Prescription",
              leading: ImageIcon(AssetImage('assets/images/pills.png')),
              route: ''),
        );}),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CheckHistory()));
          },
          child: const DrawerContainer(
              text: "Check History",
              leading: Icon(Icons.history, color: Colors.black),
              route: ''),
        ),
      Consumer<SettingsProvider>(builder: (context, provider, child){ return GestureDetector(
          onTap: () async{
                    String userEmail = FirebaseAuth.instance.currentUser!.email!;
          provider.fetchSettings();
            
            Navigator.of(context).pushNamed('/settings');
          },
          child: const  DrawerContainer(
              text: "Settings",
              leading: Icon(Icons.settings, color: Colors.black),
              route: '')
    );}),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20, left: 5, right: 5),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
         Consumer<DeviceParametersProvider>(builder: (context, provider, child){ return
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/manageDevice');
            provider.updateDeviceParametersWithFirestore();
          },
          child: const DrawerContainer(
              text: "Manage Device",
              leading: Icon(Icons.phone_android),
              route: ''),
        );}),
        const DrawerContainer(
            text: "Contact",
            leading: Icon(Icons.contact_phone_rounded),
            route: ''),
        const DrawerContainer(
            text: "Customer support",
            leading: Icon(Icons.support_agent_rounded),
            route: ''),
        GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/report');
            },
            child: const DrawerContainer(
              text: "Report",
              leading: Icon(Icons.report),
              route: '',
            )),
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
