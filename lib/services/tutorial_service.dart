import 'package:cloud_firestore/cloud_firestore.dart';

class TutorialService {
  static Future<void> addTutorial(String title, String content, String type, List<String> safetyTips) async {
    await FirebaseFirestore.instance.collection('Tutorials').add({
      'title': title,
      'content': content,
      'type': type,
      'safetyTips': safetyTips,
      'faqs': []
    });
  }
}
