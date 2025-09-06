import 'package:chatsapp/data/models/friends_model.dart';
import 'package:chatsapp/data/service/friends_service.dart';

class FriendsRepository {
  final FriendsService friendsService;

  FriendsRepository(this.friendsService);

  Future<List<FriendsModel>> getFriends(String userId)async{
    return friendsService.fetchFriends(userId);
  }
}