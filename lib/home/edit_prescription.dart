import 'package:animate_do/animate_do.dart';
import 'package:dispill/utils.dart';
import 'package:dispill/widgets/edit_prescription_widgets.dart';
import 'package:flutter/material.dart';

class EditPrescriptionScreen extends StatefulWidget {
  const EditPrescriptionScreen({super.key});

  @override
  State<EditPrescriptionScreen> createState() => _EditPrescriptionScreenState();
}

class _EditPrescriptionScreenState extends State<EditPrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    bool onStoreTap = true;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //     centerTitle: true,
      //     backgroundColor: tertiaryColor,
      //     title: const AppLargeText(
      //       color: Colors.white,
      //       text: 'Edit prescription',
      //       fontsize: 17,
      //     )),
      backgroundColor: const Color(0xffEEF3F3),
      body: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: [
                Tab(
                  child: Container(
                    color: const Color(0xffA9AEDB),
                    height: 55,
                    width: width / 2 - 1,
                    child: const Center(
                      child: AppText(
                        text: 'Prescription',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontsize: 15,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    color: const Color(0xffF3A3A6),
                    height: 55,
                    width: width / 2 - 1,
                    child: const Center(
                      child: AppText(
                        text: 'Store details',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontsize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInLeft(
                        from: height * index / 10,
                        child: TabletDataContainer(
                          edit_prescriptioncontext: context,
                        ));
                  },
                ),
                ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInRight(
                      from: height * index / 10,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: StoreDetailsBox('Paracetamol',
                            'Apollo Pharmacy, Manipal', '9876543210'),
                      ),
                    );
                  },
                ),
              ]),
            ),
            Container(
                height: 60,
                color: const Color.fromRGBO(90, 151, 151, 78 / 100),
                child: const Center(
                  child: AppText(
                    text: "Done",
                    color: Colors.white,
                    fontsize: 20,
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
