import 'package:chatsapp/data/models/friends_model.dart';
import 'package:chatsapp/data/repository/friends_repository.dart';
import 'package:flutter/material.dart';

class FriendsProvider extends ChangeNotifier {
  final FriendsRepository friendsRepository;

  FriendsProvider(this.friendsRepository);

  bool loading = false;
  List<FriendsModel> friends = [];

  Future<void> loadFriends(String userId) async {
    print("load message user: ${userId}");
    loading = true;
    notifyListeners();

    try {
      final result = await friendsRepository.getFriends(userId);
      friends = result;
    } catch (e) {
      print("error loadfriends: ${e}");
    } finally {
      loading = false;
      notifyListeners();
    }

    print(
      "📌 State sekarang -> loading: $loading, jumlah teman: ${friends.length}",
    );
  }
}
