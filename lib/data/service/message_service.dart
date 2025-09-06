import 'package:chatsapp/data/dummy/Message.dart';
import 'package:chatsapp/data/models/message_model.dart';

class MessageService {
  Future<List<Map<String, dynamic>>> fetchMessage(String roomId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return dummyMessages
        .where((msg) => msg['room_id'] == roomId)
        .toList(); // JSON mentah
  }

  Future<Map<String, dynamic>> sendMessage(Map<String, dynamic> body) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return body; // simulasi berhasil kirim, balikin data yang sama
  }
}
