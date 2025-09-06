import 'package:chatsapp/data/dummy/ChatParticipant.dart';
import 'package:chatsapp/data/models/chatparticipant_model.dart';

class ChatparticipantService {
  Future<List<ChatparticipantModel>> fetchChatParticipant(String roomId)async{
    await Future.delayed(const Duration(microseconds: 500));
    return dummyChatParticipants
      .where((p)=> p['room_id'] == roomId)
      .map((json)=> ChatparticipantModel.fromJson(json))
      .toList();
  }

  Future<ChatparticipantModel> addParticipant(ChatparticipantModel participant)async{
    await Future.delayed(const Duration(milliseconds: 500));
    return participant;
  }
}