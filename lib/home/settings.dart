import 'package:dispill/alert_dialog.dart';

import 'package:dispill/utils.dart';
import 'package:dispill/widgets/home_screen_widgets.dart';
import 'package:dispill/widgets/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool notifications = true;
bool vibrate = true;
TimeOfDay morningTime = const TimeOfDay(hour: 7, minute: 15);
TimeOfDay afternoonTime = const TimeOfDay(hour: 1, minute: 00);
TimeOfDay nightTime = const TimeOfDay(hour: 9, minute: 00);
String? selectedValue;

class _SettingScreenState extends State<SettingScreen> {
  void onNotificationSwitchChanged(bool value) {
    setState(() {
      notifications = value;
    });
  }

  void onVibrateSwitchChanged(bool value) {
    setState(() {
      vibrate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    int snoozeLength = 5;

    String sound = 'Bell';
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 255, 255, 1),
      extendBody: true,
      drawer: myDrawer(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(90, 150, 150, 75 / 100),
        title: const AppLargeText(
          text: "Settings",
          fontsize: 25,
          color: Colors.white,
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const AppLargeText(
                text: 'medications and measurements',
                fontsize: 14,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return popUpBox(
                            context, medicineswidget(), 200, 100, 'Medicines');
                      });
                },
                child: const AppText(
                  text: 'medicines',
                  fontsize: 17,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const AppLargeText(
                text: 'Notifications',
                fontsize: 14,
              ),
              const SizedBox(
                height: 20,
              ),
              const AppLargeText(
                text: 'notifications troubleshooting',
                fontsize: 17,
              ),
              const AppText(
                text: "Don't you receive notifications?",
                fontsize: 12,
              ),
              const AppText(
                text: "click for details",
                fontsize: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              const AppText(
                text: 'Snooze Length',
                fontsize: 17,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          snoozeLength = 3;
                        });
                      },
                      child: settingsCurvedBox(3, snoozeLength)),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBox(5, snoozeLength),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBox(10, snoozeLength)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: 'Show notifications on screen',
                    fontsize: 17,
                  ),
                  CupertinoSwitch(
                      value: notifications,
                      onChanged: (value) {
                        onNotificationSwitchChanged(value);
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const AppText(
                text: 'Sound',
                fontsize: 17,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  settingsCurvedBoxSound('Bell', sound),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBoxSound('Buzz', sound),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBoxSound('Bubble', sound)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    text: 'Vibrate',
                    fontsize: 17,
                  ),
                  CupertinoSwitch(
                      value: vibrate,
                      onChanged: (value) {
                        onVibrateSwitchChanged(value);
                      })
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return popUpBox(
                            context, themeWidget(), 200, 100, 'Theme');
                      });
                },
                child: const AppText(
                  text: 'Theme',
                  fontsize: 17,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const AppText(
                text: 'Set the time',
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      AppText(
                        text: "Morning",
                        fontsize: 17,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      timePicker(8, 0, 'AM')
                    ],
                  ),
                  Column(
                    children: [
                      AppText(
                        text: "Afternoon",
                        fontsize: 17,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      timePicker(1, 30, "PM")
                    ],
                  ),
                  Column(
                    children: [
                      AppText(
                        text: "Night",
                        fontsize: 17,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      timePicker(8, 30, 'PM'),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
