import 'package:animate_do/animate_do.dart';
import 'package:dispill/models/data_model.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/utils.dart';
import 'package:dispill/widgets/edit_prescription_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(90, 151, 151, 78 / 100),
        centerTitle: true,
        title: const AppText(
          text: 'Edit Prescription',
          fontWeight: FontWeight.bold,
          fontsize: 19,
          color: Colors.white,
        ),
      ),
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
            Consumer<PrescriptionStateProvider>(
                builder: (context, provider, child) {
              return Expanded(
                child: TabBarView(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const AppText(
                            text: 'Add tablets',
                            fontsize: 15,
                            color: Colors.black,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_box,
                              color: Color(0xffA9AEDB),
                            ),
                            onPressed: () {
                              if (provider.prescription.length <=
                                  provider.slotNumbersFree.length) {
                                provider.addContainers(
                                    provider.prescription.length);
                              } else {
                                //  )

                                AlertDialog(
                                  title: const AppText(
                                    text: 'No more slots available',
                                    fontsize: 15,
                                    color: Colors.black,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const AppText(
                                        text: 'OK',
                                        fontsize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              }
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ListView.builder(
                          itemCount: provider.prescription.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeInLeft(
                                from: height * index / 10,
                                child: TabletDataContainer(
                                  index: index,
                                  edit_prescriptioncontext: context,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const AppText(
                            text: 'Add Store Details',
                            fontsize: 15,
                            color: Colors.black,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_box,
                              color: Color(0xffF3A3A6),
                            ),
                            onPressed: () {
                              if (provider.storeDetails.length <= 10) {
                                provider.addStoreDetailsContainer(StoreDetails(
                                    tabletName: '',
                                    pharmacyName: '',
                                    pharmacyAddress: '',
                                    pharmacyContact: ''));


                              } else {
                                AlertDialog(
                                  title: const AppText(
                                    text: 'cannot add more stores',
                                    fontsize: 15,
                                    color: Colors.black,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const AppText(
                                        text: 'OK',
                                        fontsize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                );
                              }
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ListView.builder(
                          itemCount: provider.storeDetails.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeInRight(
                              from: height * index / 10,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                child: StoreDetailsBox(
                                    provider.storeDetails[index].tabletName,
                                    provider.storeDetails[index].pharmacyName,
                                    provider
                                        .storeDetails[index].pharmacyAddress,
                                    provider
                                        .storeDetails[index].pharmacyContact,
                                    provider.storeDetailsEditView[index],//
                                    index),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              );
            }),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 60,
                  color: const Color.fromRGBO(90, 151, 151, 78 / 100),
                  child: const Center(
                    child: AppText(
                      text: "Done",
                      color: Colors.white,
                      fontsize: 20,
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
