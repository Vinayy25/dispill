import 'package:dispill/colors.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

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
        text: '$hour${minute == 0 ? '' : ':$minute'} $period',
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
      const SizedBox(
        width: 10,
      ),
      AppText(text: '$index. '),
      const SizedBox(
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
          const SizedBox(
            width: 10,
          ),
          AppText(
            text: tabletName,
            fontsize: 14,
            color: Colors.black54,
          ),
        ]),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        height: 21,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: (full == false)
              ? Border.all(width: 3, color: const Color(0xff5FF23B))
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
              ? Border.all(width: 3, color: const Color(0xff5FF23B))
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

Widget settingsCurvedBox(int minutes, int snoozeLength, bool borderState) {
  return Container(
    height: 27,
    width: 80,
    decoration: BoxDecoration(
      border: (borderState)
          ? Border.all(width: 3, color: const Color(0xff4BD248))
          : Border.all(),
      borderRadius: BorderRadius.circular(10),
       color: borderState?Color.fromARGB(255, 24, 171, 102): Colors.white,
    ),
    child: Center(
      child: AppText(
        color: borderState? Colors.white:Colors.black,
        text: '$minutes mins',
      ),
    ),
  );
}

Widget settingsCurvedBoxSound(String sound, bool borderState) {
  return Container(
    height: 27,
    width: 80,
    decoration: BoxDecoration(
      border: (borderState)
          ? Border.all(width: 3, color: const Color(0xff4BD248))
          : Border.all(),
      borderRadius: BorderRadius.circular(10),
      color: borderState?Color.fromARGB(255, 24, 171, 102): Colors.white,
    ),
    child: Center(
      child: AppText(
        color: borderState? Colors.white:Colors.black,
        text: '$sound ',
      ),
    ),
  );
}
