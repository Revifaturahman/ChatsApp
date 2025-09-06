class FriendsModel {
  final String friendId;
  final String userId;
  final String friendUserId;
  final String status;
  final DateTime createdAt;

  FriendsModel({
    required this.friendId,
    required this.userId,
    required this.friendUserId,
    required this.status,
    required this.createdAt,
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) {
    return FriendsModel(
      friendId: json['friend_id'],
      userId: json['user_id'],
      friendUserId: json['friend_user_id'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'friend_id' : friendId,
      'user_id' : userId,
      'friend_user_id' : friendUserId,
      'status' : status,
      'created_at' : createdAt
    };
  }
}
