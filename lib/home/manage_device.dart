import 'package:dispill/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageDevice extends StatefulWidget {
  const ManageDevice({super.key});

  @override
  State<ManageDevice> createState() => _ManageDeviceState();
}

class _ManageDeviceState extends State<ManageDevice> {
  bool batteryPercentage = false;
  bool batterySaver = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Color.fromRGBO(90, 151, 151, 78 / 100),
            centerTitle: true,
            title: AppText(
              text: "Manage Device",
              color: Colors.white,
              fontsize: 20,
            )),
        backgroundColor: Colors.white,
        body: Container(
          color: Color.fromRGBO(214, 255, 255, 45 / 100),
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 10),
            children: [
              SizedBox(
                height: 20,
              ),
              AppText(
                text: 'Wireframe Design',
                fontWeight: FontWeight.bold,
                fontsize: 14,
              ),
              SizedBox(
                height: 20,
              ),
              AppText(
                text: 'Device Pairing',
                fontsize: 17,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 10,
                thickness: 0.4,
                color: const Color.fromRGBO(0, 0, 0, 28 / 100),
              ),
              SizedBox(
                height: 15,
              ),
              AppText(
                text: "Battery management",
                fontsize: 14,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/battery.png',
                    height: 87,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppText(
                        text: "70%",
                        fontsize: 30,
                        fontWeight: FontWeight.w100,
                        color: Colors.black54,
                      ),
                      AppText(
                        text: "should last until 9PM",
                        fontsize: 12,
                        color: Colors.black26,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Battery saver mode',
                    fontWeight: FontWeight.w700,
                    fontsize: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CupertinoSwitch(
                        value: batterySaver,
                        onChanged: (value) {
                          setState(() {
                            batterySaver = value;
                          });
                        }),
                  ),
                ],
              ),
              AppText(
                text: 'Battery saver will turn off when \ncharge is above 85%',
                fontsize: 12,
                color: Colors.black26,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Battery percentage',
                    fontsize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  CupertinoSwitch(
                      value: batteryPercentage,
                      onChanged: (value) {
                        setState(() {
                          batteryPercentage = value;
                        });
                      })
                ],
              ),
              AppText(
                text: 'Show battery percentage in status bar',
                fontsize: 12,
                color: Colors.black26,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 0.4,
                color: const Color.fromRGBO(0, 0, 0, 28 / 100),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Last full charge:',
                    fontWeight: FontWeight.w600,
                    fontsize: 17,
                  ),
                  AppText(
                    text: '3 days ago',
                    color: Colors.black38,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
