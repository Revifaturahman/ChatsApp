import 'package:chatsapp/data/models/chatparticipant_model.dart';
import 'package:chatsapp/data/repository/chatparticipant_repository.dart';
import 'package:flutter/material.dart';

class ChatparticipantProvider extends ChangeNotifier {
  final ChatparticipantRepository chatparticipantRepository;

  ChatparticipantProvider(this.chatparticipantRepository);

  bool isLoading = false;
  List<ChatparticipantModel> participants = [];

  Future<void> loadParticipants(String roomId) async {
    isLoading = true;
    notifyListeners();

    try {
      participants = await chatparticipantRepository.getParticipants(roomId);
      debugPrint("✅ Jumlah participants: ${participants.length}");
    } catch (e) {
      print("ERROR PROVIDER: ${e}");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
