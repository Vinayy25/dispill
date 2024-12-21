import 'package:dispill/colors.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';

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

class CurvedTextFieldsForPrescription extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String hintText;
  final double paddingL;
  final double paddingR;
  final double paddingT;
  final double paddingB;
  final int index;
  final TextInputType keyboardType;
  TextEditingController controller = TextEditingController();

  CurvedTextFieldsForPrescription({
    super.key,
    required this.index,
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
    return Consumer<PrescriptionStateProvider>(
        builder: (context, provider, child) {
      return Container(
          padding: EdgeInsets.only(
              left: paddingL, right: paddingR, bottom: paddingB, top: paddingT),
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius), color: Colors.white),
          child: TextFormField(
            controller: controller,
            onChanged: (value) {
              provider.updatePrescriptionProperty(
                  index: index, tabletName: value);
            },
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
    });
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
          onChanged: (value) {},
          keyboardType: keyboardType,
          cursorHeight: 20,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontFamily: 'roboto',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ));
  }
}

class TabletDataContainer extends StatefulWidget {
  final BuildContext edit_prescriptioncontext;
  int index;

  TabletDataContainer({
    super.key,
    required this.edit_prescriptioncontext,
    required this.index,
  });

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

    return Consumer<PrescriptionStateProvider>(
        builder: (context, provider, child) {
      tabletNameController.text =
          provider.prescription[widget.index].tabletName;

      return Container(
        height: 150,
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
              // CurvedTextFields(
              //   controller: tabletNameController,
              //   height: 26.8,
              //   width: 183,
              //   radius: 10,
              //   hintText: 'Tablet name',
              //   paddingB: 0,
              //   paddingL: 10,
              //   paddingR: 10,
              //   paddingT: 10,
              //   keyboardType: TextInputType.name,
              // ),
              Container(
                height: 26.8,
                width: 183,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffF3A3A6),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  onChanged: (value) {
                    provider.updatePrescriptionProperty(
                        index: widget.index, tabletName: value);
                  },
                  cursorHeight: 20,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 125, 96, 96),
                  ),
                  controller: tabletNameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tablet Name',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, top: -20, bottom: 5),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    provider.deleteTabelt(widget.index);
                  },
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
                  GestureDetector(
                      onTap: () {
                        provider.updatePrescriptionProperty(
                            index: widget.index,
                            frequency: {
                              'morning': true,
                              'afternoon': false,
                              'night': false
                            });
                      },
                      child: Container(
                          child: checkBoxWithName('morning', widget.index))),
                  const SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                      onTap: () {
                        provider.updatePrescriptionProperty(
                            index: widget.index,
                            frequency: {
                              'morning': false,
                              'afternoon': true,
                              'night': false
                            });
                      },
                      child: Container(
                          child: checkBoxWithName('afternoon', widget.index))),
                  const SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                      onTap: () {
                        provider.updatePrescriptionProperty(
                            index: widget.index,
                            frequency: {
                              'morning': false,
                              'afternoon': false,
                              'night': true
                            });
                      },
                      child: Container(
                          child: checkBoxWithName("night", widget.index))),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.setTabletIntakeFood(
                        widget.index,
                        true,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5),
                          color:
                              provider.prescription[widget.index].beforeFood ==
                                      true
                                  ? Colors.greenAccent
                                  : Colors.white),
                      height: 20,
                      width: 100,
                      child: const Center(
                        child: AppText(
                          text: 'Before food',
                          fontsize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setTabletIntakeFood(
                        widget.index,
                        false,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5),
                          color:
                              provider.prescription[widget.index].beforeFood ==
                                      false
                                  ? Colors.greenAccent
                                  : Colors.white),
                      height: 20,
                      width: 100,
                      child: const Center(
                        child: AppText(
                          text: 'After food',
                          fontsize: 13,
                        ),
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
                FlutterToggleTab(
                  width: 50,
                  borderRadius: 10,
                  height: 20,
                  selectedBackgroundColors: const [
                    Color.fromRGBO(90, 151, 151, 78 / 100),
                  ],
                  selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  unSelectedTextStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  labels: const ['Everyday', 'Certain days'],
                  // icons: [ Icons.calendar_today, Icons.calendar_today ],
                  selectedIndex:
                      provider.prescription[widget.index].everyday == true
                          ? 0
                          : 1,
                  selectedLabelIndex: (index) {
                    if (provider.toggleTakeCycle(widget.index) == true) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return everydayPickerWidget(
                                widget.index,
                                context,
                                everydayDayController,
                                everydayNumberofPillsController);
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return certainDaysPickerWidget(
                                widget.index,
                                context,
                                certainDaysDayController,
                                certainDaysNumberofPillsController);
                          });
                    }
                  },
                )
              ],
            ),
          )
        ]),
      );
    });
  }
}

Widget checkBoxWithName(String name, int index) {
  return Consumer<PrescriptionStateProvider>(
      builder: (context, provider, child) {
    return Row(
      children: [
        Container(
          height: 14,
          width: 14,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: provider.prescription[index].frequency[name] == true
                ? Colors.greenAccent
                : Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        AppText(text: name, fontsize: 13, fontWeight: FontWeight.bold),
      ],
    );
  });
}

Widget DaySelector(BuildContext context, String name, bool isSelected) {
  return Row(
    children: [
      Container(
        height: 9,
        width: 9,
        decoration: BoxDecoration(
            color: isSelected == true ? Colors.greenAccent : Colors.white,
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
    int index,
    BuildContext context,
    TextEditingController everydayDayController,
    TextEditingController everydayNumberofPillsController) {
  return Consumer<PrescriptionStateProvider>(
      builder: (context, provider, child) {
    everydayDayController.text =
        provider.prescription[index].courseDuration.toString();

    everydayNumberofPillsController.text =
        provider.prescription[index].dosage.toString();
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      actions: [
        Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
              color: provider.prescription[index].everyday == true
                  ? Colors.greenAccent
                  : Colors.white,
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
                  provider.updatePrescriptionProperty(
                      index: index,
                      courseDuration: int.parse(everydayDayController.text),
                      dosage:
                          double.parse(everydayNumberofPillsController.text));

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
                // CurvedTextFields(
                //   controller: everydayDayController,
                //   height: 25,
                //   width: 78,
                //   radius: 10,
                //   hintText: '15 days',
                //   keyboardType: TextInputType.number,
                //   paddingB: 0,
                //   paddingL: 10,
                //   paddingR: 0,
                //   paddingT: 10,
                // ),
                Container(
                  height: 25,
                  width: 78,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffF3A3A6),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        provider.prescription[index].courseDuration =
                            int.parse(value);
                      }
                    },
                    keyboardType: TextInputType.number,
                    cursorHeight: 20,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 125, 96, 96),
                    ),
                    controller: everydayDayController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'number',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      contentPadding:
                          EdgeInsets.only(left: 10, top: -20, bottom: 5),
                    ),
                  ),
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
                Container(
                  height: 25,
                  width: 78,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffF3A3A6),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty && !value.contains('.') ) {
                        provider.prescription[index].courseDuration =
                            int.parse(value);
                      }
                    },
                    keyboardType: TextInputType.number,
                    cursorHeight: 20,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 125, 96, 96),
                    ),
                    controller: everydayNumberofPillsController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'portion',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 10, top: -20, bottom: 5),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const AppText(text: 'dosage'),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  });
}

Widget certainDaysPickerWidget(
    int index,
    BuildContext context,
    TextEditingController certainDaysDayController,
    TextEditingController certainDaysNumberofPillsController) {
  return Consumer<PrescriptionStateProvider>(
      builder: (context, provider, child) {
    Map<String, bool> freq = provider.prescription[index].certainDays;
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
                  provider.updatePrescriptionProperty(
                    index: index,
                  );

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
                GestureDetector(
                    onTap: () {
                      print('pressed 1 ');
                      print(freq);
                      if (freq.containsKey('monday')) {
                        freq['monday'] = !freq['monday']!;
                        print('contains');
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('mon', freq['monday'] ?? false)),
                GestureDetector(
                    onTap: () {
                      if (freq.containsKey('tuesday')) {
                        freq['tuesday'] = !freq['tuesday']!;
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('tue', freq['tuesday'] ?? false)),
                GestureDetector(
                    onTap: () {
                      if (freq.containsKey('wednesday') == true) {
                        freq['wednesday'] = !freq['wednesday']!;
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('wed', freq['wednesday'] ?? false)),
                GestureDetector(
                    onTap: () {
                      if (freq.containsKey('thursday')) {
                        freq['thursday'] = !freq['thursday']!;
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('thu', freq['thursday'] ?? false)),
                GestureDetector(
                    onTap: () {
                      if (freq.containsKey('friday')) {
                        freq['friday'] = !freq['friday']!;
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('fri', freq['friday'] ?? false)),
                GestureDetector(
                    onTap: () {
                      if (freq.containsKey('saturday')) {
                        freq['saturday'] = !freq['saturday']!;
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('sat', freq['saturday'] ?? false)),
                GestureDetector(
                    onTap: () {
                      if (freq.containsKey('sunday')) {
                        freq['sunday'] = !freq['sunday']!;
                      }
                      provider.updatePrescriptionProperty(
                        index: index,
                        frequency: freq,
                      );
                    },
                    child: squareBoxWithDay('sun', freq['sunday'] ?? false)),
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
                // CurvedTextFields(
                //   controller: certainDaysDayController,
                //   height: 25,
                //   width: 78,
                //   radius: 10,
                //   hintText: '15 days',
                //   keyboardType: TextInputType.number,
                //   paddingB: 0,
                //   paddingL: 10,
                //   paddingR: 0,
                //   paddingT: 10,
                // ),
                Container(
                  height: 25,
                  width: 78,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffF3A3A6),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        provider.updatePrescriptionProperty(
                            index: index, courseDuration: int.parse(value));
                      }
                    },
                    keyboardType: TextInputType.number,
                    cursorHeight: 20,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 125, 96, 96),
                    ),
                    controller: certainDaysDayController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'number',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      contentPadding:
                          EdgeInsets.only(left: 10, top: -20, bottom: 5),
                    ),
                  ),
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
                  Container(
                    height: 25,
                    width: 78,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xffF3A3A6),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          provider.updatePrescriptionProperty(
                            index: index,
                            dosage: double.parse(value),
                          );
                        }
                      },
                      keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 125, 96, 96),
                      ),
                      controller: certainDaysNumberofPillsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'portion',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: -20, bottom: 5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const AppText(text: 'dosage'),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}

Widget squareBoxWithDay(String day, bool state) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
    child: Column(
      children: [
        Container(
          height: 14,
          width: 14,
          decoration: BoxDecoration(
              color: state == true ? Colors.greenAccent : Colors.white,
              border: Border.all(width: 1.5)),
        ),
        AppText(
          text: day,
          fontsize: 13,
        )
      ],
    ),
  );
}


class ErrorDialog {
  static void showErrorDialog(BuildContext context, dynamic error) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text('An error occurred: $error'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}