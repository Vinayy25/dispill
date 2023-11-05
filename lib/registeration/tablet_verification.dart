import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';

class TabletVerification extends StatelessWidget {
  const TabletVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 204,
                width: width,
                decoration: const BoxDecoration(color: Color(0xff98C3C9)),
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 62,
                    foregroundImage:
                        AssetImage('assets/images/female_avatar.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 204,
              child: Container(
                margin: const EdgeInsets.only(left: 30),
                height: MediaQuery.of(context).size.height - 300,
                width: 300,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const TabletDataContainer();
                  },
                ),
              ),
            ),
            Positioned(
                top: 210,
                right: 10,
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Color(0xff043BFD),
                      ),
                    ),
                    AppText(
                      text: 'Add tablet',
                      fontsize: 12,
                      color: Color(0xff043BFD),
                    ),
                  ],
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil('/homeScreen', (route) => false),
                child: Container(
                  height: 70,
                  width: 297,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: const Color(0xff2DA39B),
                  ),
                  child: const Center(
                    child: AppText(
                      text: "DONE",
                      color: Colors.white,
                      fontsize: 20,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/top_bubble_design.png')),
          ],
        ),
      ),
    );
  }
}
