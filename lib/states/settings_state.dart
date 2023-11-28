import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  bool vibrateStatus = false;
  bool notificationsStatus = false;
  void toggleNotificationState() {
    notificationsStatus = !notificationsStatus;
    notifyListeners();
  }

  void toggleVibrateState() {
    vibrateStatus = !vibrateStatus;
    notifyListeners();
  }
}

class BlockStateProvider extends ChangeNotifier {
  List<int> snooozeLength = [3, 5, 10];
  var currentSnoozeLength = 3;

  List<String> sounds = ['Bell', 'Buzz', 'Bubble'];
  var currentSound = 'Bell';

  void toggleSound(int index) {
    currentSound = sounds[index];
    notifyListeners();
  }

  void toggleSnooze(int index) {
    currentSnoozeLength = snooozeLength[index];
    notifyListeners();
  }
}
