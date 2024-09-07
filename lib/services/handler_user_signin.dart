import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import 'auth_service.dart';
import 'firestore_service.dart';

final FirestoreService _firestoreService = FirestoreService();
final AuthService _authService = AuthService();

Future<void> handleUserSignIn() async {
  User? user = await _authService.signInWithGoogle();
  if (user != null) {
    UserModel newUser = UserModel(
      userId: user.uid,
      email: user.email!,
      name: user.displayName!,
      cycleStart: DateTime.now(),  // Initial default
      cycleEnd: DateTime.now(),    // Initial default
      pcodPcos: false,             // Initial default
    );
    await _firestoreService.createUser(newUser);
    // Navigate to the main app or handle success
  }
}
