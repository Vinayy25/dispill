import 'package:dispill/models/data_model.dart';
import 'package:dispill/states/prescription_state.dart';
import 'package:dispill/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget StoreDetailsBox(String tabletName, String storeName,
    String pharmacyAddress, String contactNo, bool editView, int index) {
  TextEditingController tabletNameController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController pharmacyAddressController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  tabletNameController.text = tabletName;
  storeNameController.text = storeName;
  pharmacyAddressController.text = pharmacyAddress;
  contactNoController.text = contactNo;

  return Consumer<PrescriptionStateProvider>(
      builder: (context, provider, child) {
    return editView == true
        ? Container(
            height: 82,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
                border: Border.all(
                  color: const Color(0xffF3A3A6),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        provider.setEditView(false, index);
                        if (provider.storeDetails[index].tabletName != '') {
                          provider.addStoreDetails(
                              StoreDetails(
                                  tabletName: tabletNameController.text,
                                  pharmacyName: storeNameController.text,
                                  pharmacyAddress:
                                      pharmacyAddressController.text,
                                  pharmacyContact: contactNoController.text),
                              index);
                        }
                      },
                      icon: const Icon(
                        Icons.check_circle_outlined,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffF3A3A6),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        onChanged: (value) {
                          provider.storeDetails[index].tabletName = value;
                        },
                        cursorHeight: 20,
                        style:const  TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 125, 96, 96),
                        ),
                        controller: tabletNameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tablet Name',
                          contentPadding:
                              EdgeInsets.only(left: 10, top: -20, bottom: 5),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffF3A3A6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            onChanged: (value) {
                              provider.storeDetails[index].pharmacyName = value;
                            },
                            cursorHeight: 20,
                            style: const TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 125, 96, 96),
                            ),
                            controller: storeNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phamacy name',
                              contentPadding: EdgeInsets.only(
                                  left: 10, top: -20, bottom: 5),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffF3A3A6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            onChanged: (value) {
                              provider.storeDetails[index].pharmacyAddress =
                                  value;
                            },
                            cursorHeight: 20,
                            style:const TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 125, 96, 96),
                            ),
                            controller: pharmacyAddressController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'address',
                              contentPadding: EdgeInsets.only(
                                  left: 10, top: -20, bottom: 5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffF3A3A6),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        onChanged: (value) {
                          provider.storeDetails[index].pharmacyContact = value;
                        },
                        cursorHeight: 20,
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 125, 96, 96),
                        ),
                        controller: contactNoController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'contact number',
                          contentPadding:
                              EdgeInsets.only(left: 10, top: -20, bottom: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            height: 82,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
                border: Border.all(
                  color: const Color(0xffF3A3A6),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () {

                        provider.deleteStoreDetails(index);
                      },
                      iconSize: 20,
                      icon:const  Icon(Icons.delete),
                    )),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Consumer<PrescriptionStateProvider>(
                      builder: (context, provider, child) {
                    return IconButton(
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          provider.setEditView(true, index);
                        },
                        icon: const Icon(
                          Icons.edit,
                        ));
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(text: tabletName),
                    AppLargeText(
                      text: "$storeName, $pharmacyAddress",
                      fontsize: 16,
                    ),
                    AppText(
                      text: "contact no: $contactNo",
                      fontsize: 14,
                    ),
                  ],
                ),
              ],
            ),
          );
  });
}
