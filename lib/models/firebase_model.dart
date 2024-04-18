import 'dart:ffi';
import 'dart:html';
import 'dart:math';

import 'package:dispill/models/data_model.dart';
import 'package:dispill/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final username = FirebaseAuth.instance.currentUser?.displayName ?? "";
  Future<void> onUserLoginOrRegister() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Check if the user collection already exists
        bool userExists = await _doesUserExist(user.uid);

        // If the user collection doesn't exist, create it with default values
        if (!userExists) {
          await _createUserWithDefaultValues(user.uid, user.email ?? '');
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

    // Create the user document with default values
    DocumentReference userDocRef = _firestore.collection('USER').doc(email);
    await userDocRef.set({
      'email': email,
      'deviceId': defaultDeviceInfo.deviceId,
      'available': defaultDeviceInfo.available,
      'charge': defaultDeviceInfo.charge,
      'network': defaultDeviceInfo.network,
    });

    // Create subcollections under the user document
    // await userDocRef
    //     .collection('prescriptions')
    //     .doc('defaultPrescription')
    //     .set({
    //   'patientDetails': {
    //     'patientName': defaultPrescription.patientDetails.patientName,
    //     'age': defaultPrescription.patientDetails.age,
    //     'gender': defaultPrescription.patientDetails.gender,
    //     'contact': defaultPrescription.patientDetails.contact,
    //   },
    // });

    await userDocRef
        .collection('prescriptions')
        .doc('defaultPrescription')
        .set({
      'value': DefaultValues.getDefaultPrescription(),
    });

    await userDocRef.collection('settings').doc('defaultSettings').set({
      'snoozeLength': defaultSettingData.snoozeLength,
      'sound': defaultSettingData.sound,
      'showNotifications': defaultSettingData.showNotifications,
      'vibrate': defaultSettingData.vibrate,
      'whiteTheme': defaultSettingData.whiteTheme,
      'morning': _timeOfDayToJson(defaultSettingData.morning),
      'afternoon': _timeOfDayToJson(defaultSettingData.afternoon),
      'night': _timeOfDayToJson(defaultSettingData.night),
    });

    await userDocRef.collection('additional').doc('defaultAdditionalData').set({
      'pharmacies': defaultAdditionalData.pharmacies,
      'notes': defaultAdditionalData.notes,
      'dateOfIssue': defaultAdditionalData.dateOfIssue,
    });

    // await userDocRef.collection('setMedicines').doc('defaultSetMedicines').set({
    //   // ... (process defaultSetMedicines as needed)
    // });
  }

  Map<String, dynamic> _timeOfDayToJson(TimeOfDay timeOfDay) {
    return {'hour': timeOfDay.hour, 'minute': timeOfDay.minute};
  }

  Future<bool> fetchSettingsVibrateState() async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);

    try {
      final snapshot =
          await documentReference.collection('settings').doc(user?.email).get();
      if (snapshot.exists) {
        return snapshot.data()!['vibrate'];
      } else {
        return false;
      }
    } catch (error) {
      // Handle potential errors
      print(error);
      return false;
    }
  }

  Future<DocumentSnapshot> getSettingsData() async {
    try {
      // Use 'await' to wait for the result of the asynchronous operation
      DocumentSnapshot settingsData = await _firestore
          .collection('USER')
          .doc(user?.email)
          .collection('settings')
          .doc('defaultSettings')
          .get();

      return settingsData;
    } catch (e) {
      print('Error fetching settings data: $e');
      // You might want to handle the error or return a default value
      throw e;
    }
  }

  Future<bool> fetchSettingsNotificationsState() async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);

    try {
      final snapshot = await documentReference
          .collection('settings')
          .doc('defaultSettings')
          .get();
      if (snapshot.exists) {
        print(snapshot.data()!['showNotifications']);
        return snapshot.data()!['showNotifications'];
      } else {
        return false;
      }
    } catch (error) {
      // Handle potential errors
      print(error);
      return false;
    }
  }

  Future<void> updateSettingsInFirstore(bool value, String patameter) async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);
    try {
      await documentReference
          .collection('settings')
          .doc('defaultSettings')
          .update({
        patameter: value,
      });
    } catch (error) {
      // Handle potential errors
      print(error);
      return;
    }
  }

  Future<void> updateDeviceParameters(String parameter, dynamic value) async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);

    try {
      await documentReference.update({
        parameter: value,
      });
    } catch (error) {
      // Handle potential errors
      print(error);
      return;
    }
  }

  Future<DocumentSnapshot> getDeviceParameters() async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);

    return documentReference.get();
  }

  Future<void> updateSettingsSoundInFirstore(String currentSound) async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);
    try {
      await documentReference
          .collection('settings')
          .doc('defaultSettings')
          .update({
        'sound': currentSound,
      });
    } catch (error) {
      // Handle potential errors
      print(error);
      return;
    }
  }

  Future<void> updateSettingsSnoozeLengthInFirstore(
      int currentSnoozeLength) async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);
    try {
      await documentReference
          .collection('settings')
          .doc('defaultSettings')
          .update({
        'snoozeLength': currentSnoozeLength,
      });
    } catch (error) {
      // Handle potential errors
      print(error);
      return;
    }
  }

  Future<void> updateSettingsMorningTimeInFirstore(
      TimeOfDay time, String patameter) async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);

    try {
      await documentReference
          .collection('settings')
          .doc('defaultSettings')
          .update({
        patameter: _timeOfDayToJson(time),
      });
    } catch (error) {
      // Handle potential errors
      print(error);
      return;
    }
  }

  Future<DocumentSnapshot> getPrescription() async {
    try {
      DocumentSnapshot prescription = await _firestore
          .collection('USER')
          .doc(user?.email)
          .collection('prescriptions')
          .doc('defaultPrescription')
          .get();

      if (prescription.exists) {
        return prescription;
      } else {
        await _firestore
            .collection('USER')
            .doc(user?.email)
            .collection('prescriptions')
            .doc('defaultPrescription')
            .set({});
      }

      return await _firestore
          .collection('USER')
          .doc(user?.email)
          .collection('prescriptions')
          .doc('defaultPrescription')
          .get();
    } catch (e) {
      
      throw Exception(e.toString());
    }
  }

  Future<DocumentSnapshot> getFreeSlots() async {
    try {
      DocumentSnapshot freeSlots = await _firestore
          .collection('USER')
          .doc(user?.email)
          .collection('prescriptions')
          .doc('freeSlots')
          .get();

      if (freeSlots.exists) {
        return freeSlots;
      } else {
        await _firestore
            .collection('USER')
            .doc(user?.email)
            .collection('prescriptions')
            .doc('freeSlots')
            .set({
          '1': true,
          '2': true,
          '3': true,
          '4': true,
          '5': true,
          '6': true,
          '7': true,
          '8': true,
        });
      }
      return await _firestore
          .collection('USER')
          .doc(user?.email)
          .collection('prescriptions')
          .doc('freeSlots')
          .get();
    } catch (e) {
      print(e.toString() + "right here");
    
      throw Exception(e.toString());
    }
  }

  Future<void> updateFreeSlotsInFirstore(
      Map<String, bool> slotNumbersFree) async {
    final documentReference =
        FirebaseFirestore.instance.collection('USER').doc(user?.email);

    try {
      await documentReference
          .collection('prescriptions')
          .doc('freeSlots')
          .set(slotNumbersFree);
    } catch (error) {
      // Handle potential errors
      print(error.toString() + 'fucked');
      return;
    }
  }

  Future<void> updatePrescriptionInFirstore(Medication medication) async {
    final documentReference = FirebaseFirestore.instance
        .collection('USER')
        .doc(user?.email)
        .collection('prescriptions')
        .doc('defaultPrescription');
    if (medication.tabletName != '') {
      try {
        await documentReference.update({
          '${medication.slotNumberAllocated}': {
            'tabletName': medication.tabletName,
            'beforeFood': medication.beforeFood,
            'dosage': medication.dosage,
            'frequency': medication.frequency,
            'duration': medication.courseDuration,
            'notes': medication.notes,
            'instructions': medication.instructions,
            'everyday': medication.everyday,
            'certainDays': medication.certainDays,
            'slotNumberAllocated': medication.slotNumberAllocated,
            'courseDuration': medication.courseDuration,
          },
        });
      } catch (error) {
        // Handle potential errors
        print(error);
      }
    }
  }

  Future<void> deleteTabletInFirestore(int slotNumber) async {
    final documentReference = FirebaseFirestore.instance
        .collection('USER')
        .doc(user?.email)
        .collection('prescriptions')
        .doc('defaultPrescription');

    try {
      await documentReference.update({
        '$slotNumber': FieldValue.delete(),
      });
    } catch (error) {
      // Handle potential errors
      print(error);
      return;
    }
  }

  Future<void> addPrescriptionData({
    required Medication medication,
  }) async {
    final documentReference = FirebaseFirestore.instance
        .collection('USER')
        .doc(user?.email)
        .collection('prescriptions')
        .doc('defaultPrescription');

    try {
      // Get the current data from Firestore
      DocumentSnapshot snapshot = await documentReference.get();
      Map<String, dynamic> currentData =
          snapshot.data() as Map<String, dynamic>;

      // Update the data with the new medication information
      currentData['${medication.slotNumberAllocated}'] = {
        'tabletName': medication.tabletName,
        'beforeFood': medication.beforeFood,
        'dosage': medication.dosage,
        'frequency': medication.frequency,
        'duration': medication.courseDuration,
        'notes': medication.notes,
        'instructions': medication.instructions,
        'everyday': medication.everyday,
        'certainDays': medication.certainDays,
        'slotNumberAllocated': medication.slotNumberAllocated,
      };

      // Set the updated data back to Firestore
      await documentReference.set(currentData);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<dynamic> getStoreDetails() async {
    try {
      DocumentSnapshot storeDetails = await _firestore
          .collection('USER')
          .doc(user?.email)
          .collection('prescriptions')
          .doc('storeDetails')
          .get();
      if (storeDetails.exists) {
        return storeDetails;
      } else {
        await _firestore
            .collection('USER')
            .doc(user?.email)
            .collection('prescriptions')
            .doc('storeDetails')
            .set({});
      }
      return storeDetails;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addStoreDetails({
    required StoreDetails storeDetails,
  }) async {
    final documentReference = FirebaseFirestore.instance
        .collection('USER')
        .doc(user?.email)
        .collection('prescriptions')
        .doc('storeDetails');

    try {
      // Get the current data from Firestore
      DocumentSnapshot snapshot = await documentReference.get();
      Map<String, dynamic> currentData =
          snapshot.data() as Map<String, dynamic>;

      // Update the data with the new medication information
      currentData[storeDetails.tabletName] = {
        'tabletName': storeDetails.tabletName,
        'pharmacyName': storeDetails.pharmacyName,
        'pharmacyAddress': storeDetails.pharmacyAddress,
        'pharmacyContact': storeDetails.pharmacyContact,
      };

      // Set the updated data back to Firestore
      await documentReference.set(currentData);
      print("done");
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> deleteStoreDetailsInFirestore(String tabletName) async {
    final documentReference = FirebaseFirestore.instance
        .collection('USER')
        .doc(user?.email)
        .collection('prescriptions')
        .doc('storeDetails');

    try {
      // Get the current data from Firestore
      DocumentSnapshot snapshot = await documentReference.get();
      Map<String, dynamic> currentData =
          snapshot.data() as Map<String, dynamic>;

      // Update the data with the new medication information
      currentData.remove(tabletName);

      // Set the updated data back to Firestore
      await documentReference.set(currentData);
      print("done");
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
