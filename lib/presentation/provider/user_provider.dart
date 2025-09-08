import 'package:flutter/material.dart';
import 'package:chatsapp/data/models/user_model.dart';
import 'package:chatsapp/data/repository/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository userRepository;
  List<UserModel> users = [];
  UserModel? currentUser;

  UserProvider(this.userRepository);

  // login
  Future<bool> login(String email, String password) async {
    final fbUser = await userRepository.login(email, password);
    if (fbUser != null) {
      final profile = await userRepository.getUserProfile(fbUser.uid);
      currentUser = profile;
      notifyListeners();
      return true;
    }
    return false;
  }

  // register
  Future<bool> register(String name, String email, String password) async {
    final newUser = await userRepository.register(name, email, password);
    if (newUser != null) {
      currentUser = newUser;
      notifyListeners();
      return true;
    }
    return false;
  }

  // logout
  Future<void> logout() async {
    await userRepository.logout();
    currentUser = null;
    notifyListeners();
  }

  // ambil semua user
  Future<void> loadUsers() async {
    users = await userRepository.getUsers();
    notifyListeners();
  }
}
