import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> user;
  AuthService() {
    user = _auth.authStateChanges();
  }
  Future<String> currentUser() async {
    User user = _auth.currentUser;
    return user != null ? user.uid : null;
  }
}
