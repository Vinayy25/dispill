import 'package:dispill/colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const AppText(
      {super.key,
      required this.text,
      this.fontsize = 14,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'roboto',
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class AppLargeText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const AppLargeText(
      {super.key,
      required this.text,
      this.fontsize = 20,
      this.fontWeight = FontWeight.w600,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'roboto',
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class CurvedTextFields extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String hintText;
  final double paddingL;
  final double paddingR;
  final double paddingT;
  final double paddingB;
  final TextInputType keyboardType;
  TextEditingController controller = TextEditingController();

  CurvedTextFields({
    super.key,
    required this.height,
    required this.controller,
    required this.width,
    required this.radius,
    required this.hintText,
    required this.keyboardType,
    this.paddingL = 15,
    this.paddingR = 20,
    this.paddingT = 8,
    this.paddingB = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: paddingL, right: paddingR, bottom: paddingB, top: paddingT),
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: Colors.white),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          cursorHeight: 20,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontFamily: 'roboto',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ));
  }
}

class TabletDataContainer extends StatefulWidget {
  final BuildContext edit_prescriptioncontext;
  const TabletDataContainer(
      {super.key, required this.edit_prescriptioncontext});

  @override
  State<TabletDataContainer> createState() => _TabletDataContainerState();
}

OverlayEntry? overlayEntry;
OverlayEntry? overlayEntry1;

class _TabletDataContainerState extends State<TabletDataContainer> {
  TextEditingController tabletNameController = TextEditingController();
  TextEditingController everydayDayController = TextEditingController();
  TextEditingController everydayNumberofPillsController =
      TextEditingController();
  TextEditingController certainDaysDayController = TextEditingController();
  TextEditingController certainDaysNumberofPillsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 144,
      width: 300,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(
              2,
              2,
            ),
          ),
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CurvedTextFields(
              controller: tabletNameController,
              height: 26.8,
              width: 183,
              radius: 10,
              hintText: 'Tablet name',
              paddingB: 0,
              paddingL: 10,
              paddingR: 10,
              paddingT: 0,
              keyboardType: TextInputType.name,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_rounded,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                checkBoxWithName('Morning'),
                const SizedBox(
                  height: 7,
                ),
                checkBoxWithName('Afternoon'),
                const SizedBox(
                  height: 7,
                ),
                checkBoxWithName("Night"),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(border: Border.all(width: 1.5)),
                  height: 20,
                  width: 100,
                  child: const Center(
                    child: AppText(
                      text: 'Before food',
                      fontsize: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(border: Border.all(width: 1.5)),
                  height: 20,
                  width: 100,
                  child: const Center(
                    child: AppText(
                      text: 'After food',
                      fontsize: 13,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 18, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return everydayPickerWidget(
                              context,
                              everydayDayController,
                              everydayNumberofPillsController);
                        });
                  },
                  child: DaySelector(context, 'Everyday', false)),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return certainDaysPickerWidget(
                              context,
                              certainDaysDayController,
                              certainDaysNumberofPillsController);
                        });
                  },
                  child: DaySelector(context, "Certain days", false))
            ],
          ),
        )
      ]),
    );
  }
}

Widget checkBoxWithName(String name) {
  return Row(
    children: [
      Container(
        height: 14,
        width: 14,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.transparent,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      AppText(text: name, fontsize: 13, fontWeight: FontWeight.bold),
    ],
  );
}

Widget DaySelector(BuildContext context, String name, bool isSelected) {
  return Row(
    children: [
      Container(
        height: 9,
        width: 9,
        decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2)),
      ),
      const SizedBox(
        width: 10,
      ),
      AppText(
        text: name,
        fontsize: 13,
      )
    ],
  );
}

Widget myButton(BuildContext context, String text, double fontSize,
    double width, double height) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 163, 155, 96 / 100),
        borderRadius: BorderRadius.circular(11)),
    child: Center(
        child: AppLargeText(
      text: text,
      color: Colors.white,
      fontsize: fontSize,
    )),
  );
}

Widget everydayPickerWidget(
    BuildContext context,
    TextEditingController everydayDayController,
    TextEditingController everydayNumberofPillsController) {
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    actionsPadding: EdgeInsets.zero,
    backgroundColor: Colors.white,
    actions: [
      Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(
                  2,
                  2,
                ),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 100,
                width: 300,
                color: Colors.white,
                child: const Center(
                  child: AppLargeText(
                    text: 'OK',
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ],
    content: Container(
      color: const Color.fromRGBO(83, 100, 255, 23 / 100),
      height: 124,
      width: 300,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
              ),
              const AppText(text: 'Duration:'),
              const SizedBox(
                width: 30,
              ),
              CurvedTextFields(
                controller: everydayDayController,
                height: 25,
                width: 78,
                radius: 10,
                hintText: '15 days',
                keyboardType: TextInputType.number,
                paddingB: 0,
                paddingL: 10,
                paddingR: 0,
                paddingT: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              const AppText(text: 'days'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CurvedTextFields(
                controller: everydayNumberofPillsController,
                height: 25,
                width: 78,
                radius: 10,
                hintText: '1',
                keyboardType: TextInputType.number,
                paddingB: 0,
                paddingL: 30,
                paddingR: 0,
                paddingT: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              const AppText(text: 'pill per day'),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget certainDaysPickerWidget(
    BuildContext context,
    TextEditingController certainDaysDayController,
    TextEditingController certainDaysNumberofPillsController) {
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    actionsPadding: EdgeInsets.zero,
    backgroundColor: Colors.white,
    actions: [
      Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(
                  2,
                  2,
                ),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 170,
                width: 300,
                color: Colors.white,
                child: const Center(
                  child: AppLargeText(
                    text: 'OK',
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ],
    content: Container(
      color: const Color.fromRGBO(83, 100, 255, 23 / 100),
      height: 124,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.calendar_month,
              ),
              squareBoxWithDay('sun'),
              squareBoxWithDay('mon'),
              squareBoxWithDay('tue'),
              squareBoxWithDay('wed'),
              squareBoxWithDay('thu'),
              squareBoxWithDay('fri'),
              squareBoxWithDay('sat'),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 47,
              ),
              const AppText(text: 'Duration:'),
              const SizedBox(
                width: 30,
              ),
              CurvedTextFields(
                controller: certainDaysDayController,
                height: 25,
                width: 78,
                radius: 10,
                hintText: '15 days',
                keyboardType: TextInputType.number,
                paddingB: 0,
                paddingL: 10,
                paddingR: 0,
                paddingT: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              const AppText(text: 'days'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CurvedTextFields(
                  height: 25,
                  controller: certainDaysNumberofPillsController,
                  width: 78,
                  radius: 10,
                  hintText: '1',
                  keyboardType: TextInputType.number,
                  paddingB: 0,
                  paddingL: 30,
                  paddingR: 0,
                  paddingT: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                const AppText(text: 'pill per day'),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget squareBoxWithDay(String day) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
    child: Column(
      children: [
        Container(
          height: 14,
          width: 14,
          decoration: BoxDecoration(
              color: Colors.greenAccent, border: Border.all(width: 1.5)),
        ),
        AppText(
          text: day,
          fontsize: 13,
        )
      ],
    ),
  );
}
