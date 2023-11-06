import 'package:animate_do/animate_do.dart';
import 'package:dispill/colors.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class EditPrescriptionScreen extends StatelessWidget {
  const EditPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
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
              top: 10,
              left: 30,
              child: Container(
                height: height - 10,
                width: width - 100,
                color: Colors.transparent,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInUp(
                        from: height * index / 10,
                        child: TabletDataContainer());
                  },
                ),
              ),
            ),
            Positioned(child: Visibility(child: Container())),
            Positioned(
              top: 30,
              right: 10,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                  AppText(
                    text: 'Add tablets',
                    color: Colors.blue,
                    fontsize: 12,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0, child: MyButton(context, 'Done', 15, width, 50))
          ],
        ),
      ),
    );
  }
}
