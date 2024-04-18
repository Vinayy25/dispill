
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispill/models/firebase_model.dart';
import 'package:flutter/material.dart';


class DeviceParametersProvider extends ChangeNotifier{

  bool batteryPercentage = false;
  bool batterySaver = false;

  DeviceParametersProvider()
  {
    updateDeviceParametersWithFirestore();
  }

  void updateDeviceParametersWithFirestore()async{
    DocumentSnapshot snapshot=await  FirebaseService().getDeviceParameters();
    batteryPercentage=snapshot['batteryPercentage'];
    batterySaver=snapshot['batterySaver'];
    notifyListeners();
  }

  void changeBatteryPercentage(bool value)async{
    batteryPercentage = value;
    notifyListeners();  
    await FirebaseService().updateDeviceParameters('batteryPercentage', batteryPercentage);
  }

  void changeBatterySaver(bool value)async{
    batterySaver = value;
    notifyListeners();
   await FirebaseService().updateDeviceParameters('batterySaver', batterySaver);
  }
}
// test@gmail.com
// 123456789

