import 'package:cloud_firestore/cloud_firestore.dart';

class PCODPCOSService {
  static Future<void> addPCODPCOSData(String userId, Map<String, String> dietPlan, Map<String, String> exerciseRoutine) async {
    DocumentReference pcodPcosRef = await FirebaseFirestore.instance.collection('PCODPCOSData').add({
      'userId': FirebaseFirestore.instance.collection('Users').doc(userId),
      'dietPlan': dietPlan,
      'exerciseRoutine': exerciseRoutine,
      'lifestyleTips': [],
      'adherenceLog': []
    });

    await FirebaseFirestore.instance.collection('Users').doc(userId).update({
      'pcodPcosData': pcodPcosRef,
    });
  }
}
