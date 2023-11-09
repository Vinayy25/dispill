import 'package:animate_do/animate_do.dart';
import 'package:dispill/colors.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class EditPrescriptionScreen extends StatefulWidget {
  const EditPrescriptionScreen({super.key});

  @override
  State<EditPrescriptionScreen> createState() => _EditPrescriptionScreenState();
}

class _EditPrescriptionScreenState extends State<EditPrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: tertiaryColor,
          title: const AppLargeText(
            color: Colors.white,
            text: 'Edit prescription',
            fontsize: 17,
          )),
      backgroundColor: const Color(0xffEEF3F3),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top_bubble_design.png',
              ),
            ),
            Positioned(
              top: 0,
              left: 30,
              child: Container(
                height: height - 10,
                width: width - 57,
                color: Colors.transparent,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInUp(
                        from: height * index / 10,
                        child: TabletDataContainer(
                          edit_prescriptioncontext: context,
                        ));
                  },
                ),
              ),
            ),
            Positioned(
                bottom: 0, child: myButton(context, 'Done', 15, width, 50))
          ],
        ),
      ),
    );
  }
}
