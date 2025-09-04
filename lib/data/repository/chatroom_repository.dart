import 'package:chatsapp/data/service/chatroom_service.dart';
import 'package:chatsapp/data/models/chatroom_mode.dart';


class ChatRoomRepository {
  final ChatRoomService service;

  ChatRoomRepository(this.service);

  Future<List<ChatroomModel>> getChatRooms() async {
    final result = await service.fetchChatRooms();
    return result.map((json) => ChatroomModel.fromJson(json)).toList();
  }
}
