import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

Widget refillHistoryContainer(
    String title,
    String filledDate,
    int initialCountOfPills,
    int currentCountOfPills,
    String refillDate,
    int daysLeftToRefill) {
  return Container(
    height: 160,
    width: 150,
    decoration: BoxDecoration(
        color: const Color(0xffD39D9D),
        border: Border.all(width: 1, color: Colors.white),
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.black38,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.circular(15)),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const SizedBox(
        height: 5,
      ),
      AppText(
        text: title,
        fontsize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      const SizedBox(
        height: 3,
      ),
      AppText(
        text: "filled on $filledDate",
        color: Colors.white,
        fontsize: 10,
      ),
      const Divider(
        height: 10,
        indent: 5,
        endIndent: 5,
        thickness: 1,
        color: Colors.white,
      ),
      const SizedBox(
        height: 5,
      ),
      AppText(
        text: 'Initial count of pills: $initialCountOfPills',
        color: Colors.white,
        fontsize: 10,
        fontWeight: FontWeight.w700,
      ),
      const SizedBox(
        height: 8,
      ),
      AppText(
        text: 'Current count of pills: $currentCountOfPills',
        color: Colors.white,
        fontsize: 10,
        fontWeight: FontWeight.w700,
      ),
      const Divider(
        height: 10,
        indent: 5,
        endIndent: 5,
        thickness: 1,
        color: Colors.white,
      ),
      const SizedBox(
        height: 5,
      ),
      AppText(
        text: "Refill: $refillDate",
        color: Colors.white,
        fontsize: 10,
      ),
      const SizedBox(
        height: 10,
      ),
      AppText(
        text:
            '$daysLeftToRefill ${(daysLeftToRefill > 1) ? "days" : "day"} left to refill',
        color: Colors.white,
        fontsize: 9,
      ),
      const SizedBox(
        height: 10,
      ),
    ]),
  );
}
