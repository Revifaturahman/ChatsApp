import 'package:chatsapp/data/dummy/ChatRoom.dart';


class ChatRoomService {
  Future<List<Map<String, dynamic>>> fetchChatRooms() async {
    // simulasi delay jaringan
    await Future.delayed(const Duration(milliseconds: 500));
    return dummyChatRooms;
  }
}
