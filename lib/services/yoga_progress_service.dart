import 'package:cloud_firestore/cloud_firestore.dart';

class YogaProgressService {
  static Future<void> addYogaProgress(String userId, String routineName, Map<String, dynamic> poseDetectionData) async {
    DocumentReference yogaProgressRef = await FirebaseFirestore.instance.collection('YogaProgress').add({
      'userId': FirebaseFirestore.instance.collection('Users').doc(userId),
      'routineName': routineName,
      'poseDetectionData': poseDetectionData,
      'guidedSessions': []
    });

    await FirebaseFirestore.instance.collection('Users').doc(userId).update({
      'yogaProgress': yogaProgressRef,
    });
  }
}
