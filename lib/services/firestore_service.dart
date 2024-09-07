import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection('Users').doc(user.userId).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    DocumentSnapshot doc = await _db.collection('Users').doc(userId).get();
    return doc.exists ? UserModel.fromMap(doc.data() as Map<String, dynamic>) : null;
  }

  Future<void> updateUser(UserModel user) async {
    await _db.collection('Users').doc(user.userId).update(user.toMap());
  }
}
