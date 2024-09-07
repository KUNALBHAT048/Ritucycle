import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId;
  String email;
  String name;
  DateTime cycleStart;
  DateTime cycleEnd;
  bool pcodPcos;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.cycleStart,
    required this.cycleEnd,
    required this.pcodPcos,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'cycleStart': cycleStart,
      'cycleEnd': cycleEnd,
      'pcodPcos': pcodPcos,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      email: map['email'],
      name: map['name'],
      cycleStart: (map['cycleStart'] as Timestamp).toDate(),
      cycleEnd: (map['cycleEnd'] as Timestamp).toDate(),
      pcodPcos: map['pcodPcos'],
    );
  }
}
