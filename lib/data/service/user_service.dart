import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatsapp/data/models/user_model.dart';

class UserRepository {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // login email + password
  Future<fb.User?> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  // register user baru + simpan ke Firestore
  Future<UserModel?> register(
    String name,
    String email,
    String password,
  ) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final fb.User? firebaseUser = credential.user;

    if (firebaseUser != null) {
      final userModel = UserModel(
        id: firebaseUser.uid,
        name: name,
        email: email,
      );

      await _db
          .collection("users")
          .doc(firebaseUser.uid)
          .set(userModel.toMap());
      return userModel;
    }

    return null;
  }

  // ambil profile user dari Firestore
  Future<UserModel?> getUserProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }
}
