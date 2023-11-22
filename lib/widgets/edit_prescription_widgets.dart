import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

Widget StoreDetailsBox(String tabletName, String storeName, String contactNo) {
  return Container(
    height: 82,
    width: 280,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
        border: Border.all(
          color: const Color(0xffF3A3A6),
        ),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppText(text: tabletName),
        AppLargeText(
          text: storeName,
          fontsize: 16,
        ),
        AppText(
          text: "contact no: $contactNo",
          fontsize: 14,
        ),
      ],
    ),
  );
}
