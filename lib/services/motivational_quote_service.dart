import 'package:cloud_firestore/cloud_firestore.dart';

class MotivationalQuotesService {
  static Future<void> addMotivationalQuote(String quote, String author) async {
    await FirebaseFirestore.instance.collection('MotivationalQuotes').add({
      'quote': quote,
      'author': author,
      'date': Timestamp.now(),
    });
  }
}
