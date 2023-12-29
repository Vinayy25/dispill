import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispill/models/data_model.dart';
import 'package:dispill/models/firebase_model.dart';
import 'package:flutter/material.dart';

class PrescriptionStateProvider extends ChangeNotifier {
  List<Medication> prescription = [];
  Map<String, bool> slotNumbersFree = {
    '1': true,
    '2': true,
    '3': true,
    '4': true,
    '5': true,
    '6': true,
    '7': true,
    '8': true,
  };

  List<StoreDetails> storeDetails = [];

  List<bool> storeDetailsEditView = [];
  void setEditView(bool value, int index) {
    storeDetailsEditView[index] = value;
    notifyListeners();
  }

  void addStoreDetailsContainer(StoreDetails details) {
    storeDetails.add(details);
    storeDetailsEditView.add(true);
    notifyListeners();
  }

  void fetchStoreDetails() async {
    DocumentSnapshot snapshot = await FirebaseService().getStoreDetails();

    if (snapshot.exists) {
      Map<String, dynamic>? receivedMap =
          snapshot.data() as Map<String, dynamic>?;

      if (receivedMap != null) {
        storeDetails.clear();
        storeDetailsEditView.clear();
        receivedMap.forEach((key, value) {
          storeDetails.add(StoreDetails(
              tabletName: value['tabletName'],
              pharmacyName: value['pharmacyName'],
              pharmacyAddress: value['pharmacyAddress'],
              pharmacyContact: value['pharmacyContact']));
          storeDetailsEditView.add(false);
        });

        print(storeDetails);
      } else {
        print('no data');
      }
    }

    notifyListeners();
  }

  void deleteStoreDetails(int index) async {
    String tabletName = storeDetails[index].tabletName;
    storeDetails.removeAt(index);
    storeDetailsEditView.removeAt(index);
    notifyListeners();
    await FirebaseService().deleteStoreDetailsInFirestore(tabletName);
    notifyListeners();
  }

  void addStoreDetails(StoreDetails details, int index) async {
    await FirebaseService().addStoreDetails(
      storeDetails: StoreDetails(
        tabletName: details.tabletName,
        pharmacyName: details.pharmacyName,
        pharmacyAddress: details.pharmacyAddress,
        pharmacyContact: details.pharmacyContact,
      ),
    );
    // storeDetails.add(details);

    storeDetails[index] = (details);
    notifyListeners();
  }

  void addprescription({required Medication medication}) async {
    await FirebaseService().addPrescriptionData(
      medication: Medication(
        tabletName: medication.tabletName,
        beforeFood: medication.beforeFood,
        dosage: medication.dosage,
        frequency: medication.frequency,
        courseDuration: medication.courseDuration,
        instructions: medication.instructions,
        notes: medication.notes,
        everyday: medication.everyday,
        certainDays: medication.certainDays,
        slotNumberAllocated: medication.slotNumberAllocated,
      ),
    );
    prescription.add(medication);
    notifyListeners();
  }

  void updatePrescriptionProperty({
    required int index,
    String? tabletName,
    bool? beforeFood,
    double? dosage,
    Map<String, bool>? frequency,
    int? duration,
    List<String>? instructions,
    List<String>? notes,
    bool? everyday,
    Map<String, bool>? certainDays,
    int? slotNumber,
  }) async {
    final Medication medication = prescription[index];

    medication.tabletName = tabletName ?? medication.tabletName;
    medication.beforeFood = beforeFood ?? medication.beforeFood;
    medication.dosage = dosage ?? medication.dosage;
    medication.frequency = frequency ?? medication.frequency;
    medication.courseDuration = duration ?? medication.courseDuration;
    medication.instructions = instructions ?? medication.instructions;
    medication.notes = notes ?? medication.notes;
    medication.everyday = everyday ?? medication.everyday;
    medication.certainDays = certainDays ?? medication.certainDays;
    medication.slotNumberAllocated =
        slotNumber ?? medication.slotNumberAllocated;
    notifyListeners();

    await FirebaseService().updatePrescriptionInFirstore(medication);
    notifyListeners();
  }

  void addContainers(int index) async {
    if (index < 8) {
      String slotNumber = '0';
      for (int i = 1; i <= slotNumbersFree.length; i++) {
        if (slotNumbersFree[i.toString()] == true) {
          slotNumber = i.toString();
          print(slotNumber);
          break;
        }
      }
      slotNumbersFree[slotNumber] = false;

      prescription.add(Medication(
        tabletName: '',
        beforeFood: false,
        dosage: 0,
        frequency: {
          'morning': false,
          'afternoon': false,
          'night': false,
        },
        courseDuration: 0,
        instructions: [],
        notes: [],
        everyday: false,
        certainDays: {
          'monday': false,
          'tuesday': false,
          'wednesday': false,
          'thursday': false,
          'friday': false,
          'saturday': false,
          'sunday': false,
        },
        slotNumberAllocated: int.parse(slotNumber),
      ));
      notifyListeners();
      await FirebaseService().updatePrescriptionInFirstore(prescription[index]);
      await FirebaseService().updateFreeSlotsInFirstore(slotNumbersFree);
      notifyListeners();
    }
  }

  void updateContainer(int index, Medication medication) {
    prescription[index] = medication;
    notifyListeners();
  }

  void fetchPrescription() async {
    DocumentSnapshot snapshot = await FirebaseService().getPrescription();

    if (snapshot.exists) {
      prescription.clear();

      Map<String, dynamic> defaultPrescription =
          snapshot.data() as Map<String, dynamic>;
      defaultPrescription.forEach((key, value) {
        Map<String, dynamic> medicationData = value;

        slotNumbersFree[medicationData['slotnumberallocated'].toString()] =
            false;

        // Explicitly cast dynamic fields to the expected types
        prescription.add(Medication(
          tabletName: medicationData['tabletName'],
          beforeFood: medicationData['beforeFood'],
          dosage: medicationData['dosage'],
          frequency: (medicationData['frequency'] as Map<String, dynamic>)
              .cast<String, bool>(),
          courseDuration: medicationData['duration'],
          notes: (medicationData['notes'] as List<dynamic>)
              .cast<String>(), // Assuming 'notes' is a List<String>
          instructions: (medicationData['instructions'] as List<dynamic>)
              .cast<String>(), // Assuming 'instructions' is a List<String>
          everyday: medicationData['everyday'],
          certainDays: (medicationData['certainDays'] as Map<String, dynamic>)
              .cast<String, bool>(),
          slotNumberAllocated: medicationData['slotNumberAllocated'],
        ));
      });
    }
    notifyListeners();
    await FirebaseService().updateFreeSlotsInFirstore(slotNumbersFree);
  }

  void fetchFreeslots() async {
    DocumentSnapshot snapshot = await FirebaseService().getFreeSlots();

    if (snapshot.exists) {
      Map<String, dynamic>? receivedMap =
          snapshot.data() as Map<String, dynamic>?;

      if (receivedMap != null) {
        slotNumbersFree = receivedMap.cast<String, bool>();
        // print(slotNumbersFree);
      }
    }

    notifyListeners();
  }

  void addMedication(Medication medication) {
    prescription.add(medication);
    notifyListeners();
  }

  void editMedication(Medication medication, int index) {
    prescription[index] = medication;
    notifyListeners();
  }

  void deleteTabelt(int index) async {
    slotNumbersFree[(prescription[index].slotNumberAllocated).toString()] =
        true;
    int slotNumber = prescription[index].slotNumberAllocated;
    prescription.removeAt(index);
    notifyListeners();
    await FirebaseService().updateFreeSlotsInFirstore(slotNumbersFree);

    await FirebaseService().deleteTabletInFirestore(slotNumber);
    notifyListeners();
  }

  void setTabletIntakeFood(int index, bool beforeFood) async {
    prescription[index].beforeFood = !prescription[index].beforeFood;
    notifyListeners();
    await FirebaseService().updatePrescriptionInFirstore(prescription[index]);
    notifyListeners();
  }
}
