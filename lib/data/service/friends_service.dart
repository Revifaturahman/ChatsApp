import 'package:chatsapp/data/dummy/Friend.dart';
import 'package:chatsapp/data/models/friends_model.dart';

class FriendsService {
  Future<List<FriendsModel>> fetchFriends(String userId)async{
    await Future.delayed(const Duration(microseconds: 500));
    return dummyFriends
      .where((f) => f['user_id'] == userId)
      .map((json) => FriendsModel.fromJson(json))
      .toList();
  }
}