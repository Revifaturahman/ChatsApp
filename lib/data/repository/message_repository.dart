import 'package:chatsapp/data/models/message_model.dart';
import 'package:chatsapp/data/service/message_service.dart';

class MessageRepository {
  final MessageService messageService;

  MessageRepository(this.messageService);

  Future<List<MessageModel>> getMessage(String roomId) async {
    final data = await messageService.fetchMessage(roomId);
    return data
        .map((e) => MessageModel.fromJson(e))
        .toList(); // ✅ mapping ke model
  }

  Future<MessageModel> sendMessage(MessageModel message) async {
    final data = await messageService.sendMessage(message.toJson());
    return MessageModel.fromJson(data); // ✅ balikin model
  }
}
