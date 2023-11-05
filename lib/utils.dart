import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      style: GoogleFonts.inter(
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
        fontFamily: 'inter',
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

  const CurvedTextFields({
    super.key,
    required this.height,
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
          keyboardType: keyboardType,
          cursorHeight: 20,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontFamily: 'inter',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ));
  }
}

class TabletDataContainer extends StatefulWidget {
  const TabletDataContainer({super.key});

  @override
  State<TabletDataContainer> createState() => _TabletDataContainerState();
}

class _TabletDataContainerState extends State<TabletDataContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 300,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffD9D9D9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 0,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CurvedTextFields(
                height: 26.8,
                width: 183,
                radius: 10,
                hintText: 'Tablet name',
                paddingB: 0,
                paddingL: 10,
                paddingR: 10,
                paddingT: 0,
                keyboardType: TextInputType.name),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete_rounded))
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
                )
              ],
            )
          ],
        ),
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
        margin: EdgeInsets.only(left: 10),
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
