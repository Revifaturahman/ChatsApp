import 'package:firebase_auth/firebase_auth.dart';

Future<User?> getUser() async {
  return FirebaseAuth.instance.currentUser;
}
