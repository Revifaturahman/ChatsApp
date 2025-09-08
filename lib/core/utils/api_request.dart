import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, String>> buildHeaders() async {
  final user = FirebaseAuth.instance.currentUser;
  final headers = <String, String>{'Content-Type': 'application/json'};

  if (user != null) {
    final idToken = await user.getIdToken(); // Firebase ID Token
    headers['Authorization'] = 'Bearer $idToken';
  }

  return headers;
}
