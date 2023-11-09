import 'package:dispill/alert_dialog.dart';
import 'package:dispill/colors.dart';

import 'package:dispill/home/home_screen.dart';
import 'package:dispill/utils.dart';
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
                  settingsCurvedBox('3 mins'),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBox('5 mins'),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBox('10 mins')
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
                  settingsCurvedBox('Bell'),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBox('Buzz'),
                  const SizedBox(
                    width: 20,
                  ),
                  settingsCurvedBox('Bubble')
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

Widget timePicker(int hour, int minute, String period) {
  return Container(
      height: 24,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: AppText(
        color: Colors.black38,
        text: '$hour' + (minute == 0 ? '' : ':$minute') + ' $period',
        fontsize: 15,
      )));
}

Widget timeSlotWithIcon(TimeOfDay time, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, top: 10),
    child: Row(
      children: [
        Container(
          height: 25,
          width: 75,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: AppText(
            text: time.format(context),
            fontsize: 15,
          )),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.access_time_filled),
        )
      ],
    ),
  );
}

Widget snoozeWidget() {
  return Container(
    color: primaryColor,
    height: 100,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 20,
            width: 200,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: AppText(
              text: "5 minutes",
            )),
          ),
          Container(
            height: 20,
            width: 200,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: AppText(
              text: "10 minutes",
            )),
          ),
          Container(
            height: 20,
            width: 200,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: AppText(
              text: "15 minutes",
            )),
          ),
        ],
      ),
    ),
  );
}

Widget themeWidget() {
  return Container(
    height: 100,
    width: 200,
    color: primaryColor,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: const Center(child: AppText(text: "Dark theme")),
      ),
      Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: const Center(child: AppText(text: "Light theme")),
      ),
    ]),
  );
}

Widget soundWidget() {
  return Container(
    height: 150,
    width: 300,
    color: primaryColor,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: const Center(child: AppText(text: "Bell")),
      ),
      Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: const Center(child: AppText(text: "Buzz")),
      ),
      Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: const Center(child: AppText(text: "Bubble")),
      ),
    ]),
  );
}

Widget medicineswidget() {
  return Container(
      height: 300,
      width: 300,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          medicinesWidgetRow('Acetaminophen', true, 1),
          medicinesWidgetRow('Adderall', false, 2),
          medicinesWidgetRow('Amitriptyline', true, 3),
          medicinesWidgetRow('Amoxicillin', true, 4),
          medicinesWidgetRow('Ativan', false, 5),
          medicinesWidgetRow('Atorvastatin', true, 6),
          medicinesWidgetRow('Azithromycin', true, 7),
          medicinesWidgetRow('Asprin', true, 8),
        ],
      ));
}

Widget medicinesWidgetRow(String tabletName, bool full, int index) {
  return Row(
    children: [
      SizedBox(
        width: 10,
      ),
      AppText(text: '$index. '),
      SizedBox(
        width: 10,
      ),
      Container(
        height: 21,
        width: 153,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(children: [
          SizedBox(
            width: 10,
          ),
          AppText(
            text: tabletName,
            fontsize: 14,
            color: Colors.black54,
          ),
        ]),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        height: 21,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: (full == false)
              ? Border.all(width: 3, color: Color(0xff5FF23B))
              : Border.all(width: 0),
        ),
        child: const Center(
            child: AppText(
          text: 'Full',
        )),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        height: 21,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: (full == true)
              ? Border.all(width: 3, color: Color(0xff5FF23B))
              : Border.all(width: 0),
        ),
        child: const Center(
            child: AppText(
          text: 'Half',
        )),
      )
    ],
  );
}

Widget settingsCurvedBox(String text) {
  return Container(
    height: 27,
    width: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all()),
    child: Center(
      child: AppText(
        text: text,
      ),
    ),
  );
}
