import 'package:dispill/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckHistory extends StatefulWidget {
  const CheckHistory({super.key});

  @override
  State<CheckHistory> createState() => _CheckHistoryState();
}

class _CheckHistoryState extends State<CheckHistory> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: const AppLargeText(
          text: "History",
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(
          90,
          151,
          151,
          78 / 100,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // height: height   ,
          color: const Color.fromRGBO(214, 255, 255, 45 / 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: width,
                color: const Color(0xffF3A3A6),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      rowSelectable(
                          const Icon(
                            Icons.history,
                            color: Colors.white,
                          ),
                          'Last 7 days'),
                      const SizedBox(
                        height: 10,
                      ),
                      rowSelectable(
                          Image.asset(
                            'assets/images/count_tabs.png',
                            scale: 4,
                          ),
                          ''),
                      const SizedBox(
                        height: 10,
                      ),
                      rowSelectable(
                          Image.asset(
                            'assets/images/select_tabs.png',
                            scale: 4,
                          ),
                          ''),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 136,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xff808080),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: const Center(
                      child: AppText(
                        text: "Tablet History",
                        fontsize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/refillHistory');
                    },
                    child: Container(
                      width: 136,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff808080),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: const Center(
                        child: AppText(
                          text: "Pill Refill History",
                          fontsize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                height: height / 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 45,
                    width: 162,
                    decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2,
                              spreadRadius: 0.5,
                              offset: Offset(0, 5))
                        ]),
                    child: const Center(
                        child: Column(
                      children: [
                        Icon(Icons.list),
                        AppText(
                          text: "List",
                        ),
                      ],
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 45,
                    width: 162,
                    decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 5))
                        ]),
                    child: const Center(
                      child: Column(
                        children: [
                          Icon(Icons.bar_chart),
                          AppText(
                            text: "Chart",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataPoint<T, R> {
  final T x;
  final R y;

  DataPoint(this.x, this.y);
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

Widget rowSelectable(Widget icon, String text) {
  return Row(
    children: [
      const SizedBox(
        width: 50,
      ),
      icon,
      const SizedBox(
        width: 10,
      ),
      Container(
        width: 200,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2.0,
              color: Colors.white,
            ),
          ),
        ),
        child: Center(
          child: AppText(
            text: text,
            color: Colors.white54,
            fontsize: 15,
          ),
        ),
      ),
      const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
        size: 30,
      )
    ],
  );
}

Widget chartInfo(
    int index, List<Color> chartColor, String tabletName, String value) {
  return Row(
    children: [
      Container(
        height: 10,
        width: 10,
        color: chartColor[index],
      ),
      const SizedBox(
        width: 5,
      ),
      AppText(
        text: "$tabletName-$value%",
        fontsize: 10,
      ),
    ],
  );
}
