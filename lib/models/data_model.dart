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
  final String tabletName;
  final int dosage;
  final Map<String, bool> frequency;
  final int courseDuration;
  final List<String> instructions;
  final List<String> notes;
  final bool everyday;
  final Map<String, bool> certainDays;
  final int slotNumberAllocated;

  Medication({
    required this.tabletName,
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
}

class MedicineSlot {
  final int slotNo;
  final List<TabletInfo> tablets;

  MedicineSlot({
    required this.slotNo,
    required this.tablets,
  });
}

class TabletInfo {
  final String tabletName;
  final bool fullTablet;

  TabletInfo({
    required this.tabletName,
    required this.fullTablet,
  });
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

  static Prescription getDefaultPrescription() {
    return Prescription(
      patientDetails: PatientDetails(
        patientName: 'John Doe',
        age: 30,
        gender: 'Male',
        contact: '1234567890',
      ),
      medications: [
        Medication(
          tabletName: 'Default Tablet',
          dosage: 1,
          frequency: {'morning': true, 'afternoon': true, 'night': true},
          courseDuration: 7,
          instructions: ['Take with water', 'Before meals'],
          notes: ['Note 1', 'Note 2'],
          everyday: true,
          certainDays: {
            'Monday': true,
            'Tuesday': true,
            'Wednesday': true,
            'Thursday': true,
            'Friday': true,
            'Saturday': true,
            'Sunday': true,
          },
          slotNumberAllocated: 1,
        ),
      ],
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
      snoozeLength: 10,
      sound: 'default.mp3',
      showNotifications: true,
      vibrate: false,
      whiteTheme: true,
      morning: const TimeOfDay(hour: 8, minute: 0),
      afternoon: const TimeOfDay(hour: 12, minute: 0),
      night: const TimeOfDay(hour: 20, minute: 0),
    );
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
