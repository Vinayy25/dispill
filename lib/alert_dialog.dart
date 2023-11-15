import 'package:dispill/colors.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

Widget popUpBox(BuildContext context, Widget widget, double height,
    double width, String title) {
  return AlertDialog(
    title: Container(
        height: 50,
        width: 300,
        color: const Color.fromRGBO(90, 151, 151, 78 / 100),
        child: Center(child: AppLargeText(text: title))),
    contentPadding: EdgeInsets.zero,
    actionsPadding: EdgeInsets.zero,
    titlePadding: EdgeInsets.zero,
    backgroundColor: Colors.white,
    actions: [
      Container(
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 300,
                color: const Color.fromRGBO(90, 151, 151, 78 / 100),
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
    content: widget,
  );
}
