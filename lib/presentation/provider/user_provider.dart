import 'package:chatsapp/data/models/user_model.dart';
import 'package:chatsapp/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserRepository userRepository;
  List<User> users = [];

  UserProvider(this.userRepository);

  Future<void> loadUser() async {
    print("DEBUG: mulai load users...");
    users = await userRepository.getUsers();
    print("DEBUG: total users = ${users.length}");
    for (var u in users) {
      print("DEBUG: ${u.id} - ${u.name}");
    }
    notifyListeners();
  }
}
