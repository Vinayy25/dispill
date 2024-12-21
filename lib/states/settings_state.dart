import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispill/models/firebase_model.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool vibrateStatus=true;
  bool notificationsStatus = false;
  List<int> snoozeLength = [3, 5, 10];
  var currentSnoozeLength = 3;

  List<String> sounds = ['Bell', 'Buzz', 'Bubble'];
  var currentSound = 'Bell';
  bool whiteTheme = true;
  TimeOfDay morning = TimeOfDay.now();
  TimeOfDay afternoon = TimeOfDay.now();
  TimeOfDay night = TimeOfDay.now();

  SettingsProvider() {
    fetchSettings();
  }
  
  void fetchSettings()async{
   DocumentSnapshot snapshot= await FirebaseService().getSettingsData();

    if(snapshot.exists){
      vibrateStatus = snapshot['vibrate'];
      notificationsStatus = snapshot['showNotifications'];
      currentSnoozeLength = snapshot['snoozeLength'];
      currentSound = snapshot['sound'];
      whiteTheme = snapshot['whiteTheme'];
      morning = TimeOfDay(
          hour: snapshot['morning']['hour'],
          minute: snapshot['morning']['minute']);
      afternoon = TimeOfDay(
          hour: snapshot['afternoon']['hour'],
          minute: snapshot['afternoon']['minute']);
      night = TimeOfDay(
          hour: snapshot['night']['hour'],
          minute: snapshot['night']['minute']);
    }
    else{
      vibrateStatus = true;
      notificationsStatus = false;
      currentSnoozeLength = 3;
      currentSound = 'Bell';
      whiteTheme = true;
      morning = const TimeOfDay(
          hour: 8,
          minute: 0);
      afternoon = const TimeOfDay(
          hour: 13,
          minute: 0);
      night =const  TimeOfDay(
          hour: 20,
          minute: 0);
    }
    notifyListeners();
  }

  void toggleTheme() {
    whiteTheme = !whiteTheme;
    
    notifyListeners();
  }

  void toggleNotificationState() async{
    notificationsStatus = !notificationsStatus;
    notifyListeners();
    await FirebaseService().updateSettingsInFirstore(notificationsStatus,'showNotifications');
  }

  void toggleVibrateState()async {
    vibrateStatus = !vibrateStatus;
    notifyListeners();
    await FirebaseService().updateSettingsInFirstore(vibrateStatus,'vibrate');
  }

  void toggleSound(int index) async{
    currentSound = sounds[index];
    notifyListeners();
    await FirebaseService().updateSettingsSoundInFirstore(currentSound);
  }

  void toggleSnooze(int index) async{
    currentSnoozeLength = snoozeLength[index];
    notifyListeners();
    await FirebaseService().updateSettingsSnoozeLengthInFirstore(currentSnoozeLength);
  }

  void morningTime(TimeOfDay time) async{
    morning = time;
    notifyListeners();
    await FirebaseService().updateSettingsMorningTimeInFirstore(morning,'morning');
  }

  void afternoonTime(TimeOfDay time) async{
    afternoon = time;
    notifyListeners();
    await FirebaseService().updateSettingsMorningTimeInFirstore(afternoon,'afternoon');
    }

  void nightTime(TimeOfDay time) async{
    night = time;
    notifyListeners();
    await FirebaseService().updateSettingsMorningTimeInFirstore(night,'night');
  }
}



