import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class USER {
//   final String userId;
//   final String email;
//   final List<DeviceInfo> deviceInfoList;
//   final List<Prescription> prescriptions;
//   final SettingData settings;
//   final AdditionalData additionalData;
//   final SetMedicines setMedicines;

//   USER({
//     required this.userId,
//     required this.email,
//     required this.deviceInfoList,
//     required this.prescriptions,
//     required this.settings,
//     required this.additionalData,
//     required this.setMedicines,
//   });
// }

class DeviceInfo {
  final String deviceId;
  final bool available;
  final int charge;
  final int network;

  DeviceInfo({
    required this.deviceId,
    required this.available,
    required this.charge,
    required this.network,
  });
}

class Prescription {
  final PatientDetails patientDetails;
  final List<Medication> medications;   

  Prescription({
    required this.patientDetails,
    required this.medications,
  });
}

class PatientDetails {
  final String patientName;
  final int age;
  final String gender;
  final String contact;

  PatientDetails({
    required this.patientName,
    required this.age,
    required this.gender,
    required this.contact,
  });
}

class Medication {
  String tabletName;
   double dosage;
   Map<String, bool> frequency;
   bool beforeFood;
   int courseDuration;
   List<String> instructions;
   List<String> notes;
   bool everyday;
   Map<String, bool> certainDays={
 
   };
   int slotNumberAllocated;


  Medication({
    required this.tabletName,
    required this.beforeFood,
    required this.dosage,
    required this.frequency,
    required this.courseDuration,
    required this.instructions,
    required this.notes,
    required this.everyday,
    required this.certainDays,
    required this.slotNumberAllocated,
  });
}

class StoreDetails{
  String tabletName;
  String pharmacyName;
  String pharmacyAddress;
  String pharmacyContact;

  StoreDetails({
    required this.tabletName,
    required this.pharmacyName,
    required this.pharmacyAddress,
    required this.pharmacyContact,
  });
  
}



class SettingData {
  final List<MedicineSlot> medicines;
  final int snoozeLength;
  final String sound;
  final bool showNotifications;
  final bool vibrate;
  final bool whiteTheme;
  final TimeOfDay morning;
  final TimeOfDay afternoon;
  final TimeOfDay night;

  SettingData({
    required this.medicines,
    required this.snoozeLength,
    required this.sound,
    required this.showNotifications,
    required this.vibrate,
    required this.whiteTheme,
    required this.morning,
    required this.afternoon,
    required this.night,
  });

  factory SettingData.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    
    // Convert the 'medicines' data into a List<MedicineSlot>
    List<MedicineSlot> medicines = List.from(data['medicines']).map((item) => MedicineSlot.fromMap(item)).toList();

    return SettingData(
      medicines: medicines,
      snoozeLength: data['snoozeLength']??5,
      sound: data['sound']??'Bell',
      showNotifications: data['showNotifications']??true,
      vibrate: data['vibrate']??true,
      whiteTheme: data['whiteTheme']??true,
      morning: TimeOfDay.fromDateTime(DateTime.parse(data['morning']))??const TimeOfDay(hour: 8, minute: 0),
      afternoon: TimeOfDay.fromDateTime(DateTime.parse(data['afternoon']))??const TimeOfDay(hour: 12, minute: 0),
      night: TimeOfDay.fromDateTime(DateTime.parse(data['night']))??const TimeOfDay(hour: 20, minute: 0)
    );
  }

  // Add any additional methods or helper functions as needed.

  static Future<SettingData?> getSettingsData(String userEmail) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance
          .collection('USER')
          .doc(userEmail)
          .collection('settings')
          .doc('settingsDocId') // Replace 'settingsDocId' with the actual document ID
          .get();

      if (documentSnapshot.exists) {
        return SettingData.fromFirestore(documentSnapshot);
      } else {
        return null; // Handle the case where the document does not exist
      }
    } catch (e) {
      print('Error fetching settings data: $e');
      return null; // Handle the error as needed
    }
  }
}


class MedicineSlot {
  final int slotNo;
  final List<TabletInfo> tablets;

  MedicineSlot({
    required this.slotNo,
    required this.tablets,
  });

  factory MedicineSlot.fromMap(Map<String, dynamic> map) {
    // Convert the 'tablets' data into a List<TabletInfo>
    List<TabletInfo> tablets = List.from(map['tablets']).map((item) => TabletInfo.fromMap(item)).toList();

    return MedicineSlot(
      slotNo: map['slotNo'],
      tablets: tablets,
    );
  }
}


class TabletInfo {
  final String tabletName;
  final bool fullTablet;

  TabletInfo({
    required this.tabletName,
    required this.fullTablet,
  });

  factory TabletInfo.fromMap(Map<String, dynamic> map) {
    return TabletInfo(
      tabletName: map['tabletName'],
      fullTablet: map['fullTablet'],
    );
  }
}

class AdditionalData {
  final Map<String, String> pharmacies;
  final List<String> notes;
  final List<Reminder> reminders;
  final String dateOfIssue;

  AdditionalData({
    required this.pharmacies,
    required this.notes,
    required this.reminders,
    required this.dateOfIssue,
  });
}

class Reminder {
  final String reminderText;
  final TimeOfDay time;

  Reminder({
    required this.reminderText,
    required this.time,
  });
}

class SetMedicines {
  final Map<int, List<TabletTime>> medicines;

  SetMedicines({
    required this.medicines,
  });
}

class TabletTime {
  final String tabletName;
  final TimeOfDay time;

  TabletTime({
    required this.tabletName,
    required this.time,
  });
}

class DefaultValues {
  static DeviceInfo getDefaultDeviceInfo() {
    return DeviceInfo(
      deviceId: 'default_device_id',
      available: true,
      charge: 100,
      network: 4,
    );
  }
  static SettingData getDefaultSettingData() {
    return SettingData(
      medicines: [
        MedicineSlot(
          slotNo: 1,
          tablets: [
            TabletInfo(tabletName: 'Default Tablet', fullTablet: true),
          ],
        ),
      ],
      snoozeLength: 5,
      sound: 'Bell',
      showNotifications: true,
      vibrate: true,
      whiteTheme: true,
      morning: const TimeOfDay(hour: 8, minute: 0),
      afternoon: const TimeOfDay(hour: 12, minute: 0),
      night: const TimeOfDay(hour: 20, minute: 0),
    );
  }

  static getDefaultPrescription(){
     return [];
  }

  static AdditionalData getDefaultAdditionalData() {
    return AdditionalData(
      pharmacies: {'Default Pharmacy': '1234567890'},
      notes: ['Default Note 1', 'Default Note 2'],
      reminders: [
        Reminder(
            reminderText: 'Default Reminder',
            time: const TimeOfDay(hour: 9, minute: 0)),
      ],
      dateOfIssue: '2023-01-01',
    );
  }

  static SetMedicines getDefaultSetMedicines() {
    return SetMedicines(medicines: {});
  }
}
