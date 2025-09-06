import 'package:chatsapp/data/models/message_model.dart';
import 'package:chatsapp/data/repository/message_repository.dart';
import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  final MessageRepository repository;

  MessageProvider(this.repository);

  bool loading = false;
  List<MessageModel> message = [];

  Future<void> loadMessage(String roomId) async {
    print("🚀 loadMessage dipanggil dengan roomId: $roomId"); // ✅ debug awal
    loading = true;
    notifyListeners();

    try {
      final result = await repository.getMessage(roomId);
      message = result;
    } catch (e) {
      print("❌ Error loadMessage: $e");
    } finally {
      loading = false; // ✅ jangan lupa matikan loading
      notifyListeners();
    }

    print(
      "📌 State sekarang -> loading: $loading, jumlah message: ${message.length}",
    );
  }
}
