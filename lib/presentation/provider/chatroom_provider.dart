import 'package:chatsapp/data/repository/chatroom_repository.dart';
import 'package:chatsapp/data/models/chatroom_mode.dart';
import 'package:flutter/material.dart';

class ChatRoomProvider extends ChangeNotifier {
  final ChatRoomRepository repository;
  List<ChatroomModel> rooms = [];
  bool isLoading = false;

  ChatRoomProvider(this.repository);

  Future<void> loadChatRooms() async {
    isLoading = true;
    notifyListeners();

    rooms = await repository.getChatRooms();

    print("User Length : ${rooms.length})");
    for (var u in rooms) {
      print("DEBUG: ${u.id} - ${u.type}");
    }

    isLoading = false;
    notifyListeners();
  }
}
