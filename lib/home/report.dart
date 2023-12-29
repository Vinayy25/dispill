import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromRGBO(90, 151, 151, 78 / 100),
        title: const AppText(
          text: "Report",
          color: Colors.white,
          fontsize: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Fault*",
                          fontsize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    reportErrorSelectionContainer("Select Fault"),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppText(
                      text: 'Frequency of occurence*',
                      fontWeight: FontWeight.w600,
                      fontsize: 17,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    reportErrorSelectionContainer('Select Frequency'),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppText(
                      text: 'Detailed description',
                      fontsize: 15,
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 112,
                      width: 265,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 26 / 100)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText:
                                'Describe the operating steps and results',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black38),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Divider(
                    //   thickness: 1,
                    //   color: Color.fromRGBO(217, 217, 217, 1),
                    // ),
                    const SizedBox(
                      height: 0,
                    ),
                    const AppText(
                      text: 'contact information',
                      fontsize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 42,
                      width: 265,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, bottom: 5),
                          hintText: 'Phone number',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.black45),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(90, 151, 151, 78 / 100),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: AppText(
                        text: "Submit",
                        fontsize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                    )
                  ])),
        ),
      ),
    );
  }
}

Widget reportErrorSelectionContainer(String hintText) {
  return Container(
    width: 265,
    height: 35,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: AppText(
            text: hintText,
            fontsize: 12,
            color: Colors.black45,
          ),
        ),
        const Icon(Icons.arrow_drop_down_outlined)
      ],
    ),
  );
}
