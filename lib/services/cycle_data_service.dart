import 'package:cloud_firestore/cloud_firestore.dart';

class CycleDataService {
  static Future<void> addCycleData(String userId, Timestamp startDate, Timestamp endDate, List<String> symptoms) async {
    DocumentReference cycleRef = await FirebaseFirestore.instance.collection('CycleData').add({
      'userId': FirebaseFirestore.instance.collection('Users').doc(userId),
      'startDate': startDate,
      'endDate': endDate,
      'symptoms': symptoms,
      'ovulationDate': null,
      'reminders': {
        'periodReminder': false,
        'ovulationReminder': false,
        'fertilityReminder': false,
      }
    });

    await FirebaseFirestore.instance.collection('Users').doc(userId).update({
      'cycleData': cycleRef,
    });
  }
}
