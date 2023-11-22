import 'package:dispill/utils.dart';
import 'package:dispill/widgets/check_history_widgets.dart';
import 'package:flutter/material.dart';

class PillRefillHistory extends StatefulWidget {
  const PillRefillHistory({super.key});

  @override
  State<PillRefillHistory> createState() => _PillRefillHistoryState();
}

class _PillRefillHistoryState extends State<PillRefillHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(90, 151, 151, 78 / 100),
        centerTitle: true,
        title: const AppLargeText(
          text: "Refill History",
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                refillHistoryContainer('tablet ${index * 2}', '25/09/2023', 30,
                    10, '25/09/2023', 10),
                refillHistoryContainer('tablet ${index * 2 + 1}', '25/09/2023',
                    10, 5, '25/09/2023', 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
