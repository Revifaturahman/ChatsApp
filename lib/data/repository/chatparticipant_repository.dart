import 'package:chatsapp/data/models/chatparticipant_model.dart';
import 'package:chatsapp/data/service/chatparticipant_service.dart';

class ChatparticipantRepository {
  final ChatparticipantService chatparticipantService;

  ChatparticipantRepository(this.chatparticipantService);

  Future<List<ChatparticipantModel>> getParticipants(String roomId){
    return chatparticipantService.fetchChatParticipant(roomId);
  }

  Future<ChatparticipantModel> addParticipant(ChatparticipantModel participant){
    return chatparticipantService.addParticipant(participant);
  }
}