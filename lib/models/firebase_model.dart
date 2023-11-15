import 'package:dispill/models/data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> onUserLoginOrRegister() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Check if the user collection already exists
        bool userExists = await _doesUserExist(user.uid);

        // If the user collection doesn't exist, create it with default values
        if (!userExists) {
          await _createUserWithDefaultValues(user.uid, user.email!);
        }
      }
    } catch (e) {
      print('Error checking or creating user collection: $e');
    }
  }

  Future<bool> _doesUserExist(String userId) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('USERS').doc(userId).get();
    return snapshot.exists;
  }

  Future<void> _createUserWithDefaultValues(String userId, String email) async {
    // Set default values for the user
    DeviceInfo defaultDeviceInfo = DefaultValues.getDefaultDeviceInfo();
    Prescription defaultPrescription = DefaultValues.getDefaultPrescription();
    SettingData defaultSettingData = DefaultValues.getDefaultSettingData();
    AdditionalData defaultAdditionalData =
        DefaultValues.getDefaultAdditionalData();
    SetMedicines defaultSetMedicines = DefaultValues.getDefaultSetMedicines();

    // Create the user collection with default values
    await _firestore.collection('users').doc(userId).set({
      'deviceId': defaultDeviceInfo.deviceId,
      'available': defaultDeviceInfo.available,
      'charge': defaultDeviceInfo.charge,
      'network': defaultDeviceInfo.network,
      'prescription': {
        'patientDetails': {
          'patientName': defaultPrescription.patientDetails.patientName,
          'age': defaultPrescription.patientDetails.age,
          'gender': defaultPrescription.patientDetails.gender,
          'contact': defaultPrescription.patientDetails.contact,
        },
        'medications': defaultPrescription.medications.map((medication) {
          return {
            'tabletName': medication.tabletName,
            'dosage': medication.dosage,
            // ... (other medication properties)
          };
        }).toList(),
      },
      'settingData': {
        'medicines': defaultSettingData.medicines.map((medicineSlot) {
          return {
            'slotNo': medicineSlot.slotNo,
            'tablets': medicineSlot.tablets.map((tabletInfo) {
              return {
                'tabletName': tabletInfo.tabletName,
                'fullTablet': tabletInfo.fullTablet,
              };
            }).toList(),
          };
        }).toList(),
        'snoozeLength': defaultSettingData.snoozeLength,
        'sound': defaultSettingData.sound,
        'showNotifications': defaultSettingData.showNotifications,
        'vibrate': defaultSettingData.vibrate,
        'whiteTheme': defaultSettingData.whiteTheme,
        'morning': _timeOfDayToJson(defaultSettingData.morning),
        'afternoon': _timeOfDayToJson(defaultSettingData.afternoon),
        'night': _timeOfDayToJson(defaultSettingData.night),
      },
      'additionalData': {
        'pharmacies': defaultAdditionalData.pharmacies,
        'notes': defaultAdditionalData.notes,
        'reminders': defaultAdditionalData.reminders.map((reminder) {
          return {
            'reminderText': reminder.reminderText,
            'time': _timeOfDayToJson(reminder.time),
          };
        }).toList(),
        'dateOfIssue': defaultAdditionalData.dateOfIssue,
      },
      'setMedicines': {
        // ... (process defaultSetMedicines as needed)
      },
    });
  }

  Map<String, dynamic> _timeOfDayToJson(TimeOfDay timeOfDay) {
    return {'hour': timeOfDay.hour, 'minute': timeOfDay.minute};
  }
}
