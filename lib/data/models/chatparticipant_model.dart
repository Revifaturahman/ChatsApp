class ChatparticipantModel {
  final String roomId;
  final String userId;
  final bool isAdmin;
  final DateTime joinedAt;

  ChatparticipantModel({
    required this.roomId,
    required this.userId,
    this.isAdmin = false,
    required this.joinedAt,
  });

  factory ChatparticipantModel.fromJson(Map<String, dynamic> json) {
    return ChatparticipantModel(
      roomId: json['room_id'],
      userId: json['user_id'],
      isAdmin: json['is_admin'] ?? false,
      joinedAt: DateTime.parse(json['joined_at']),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'room_id': roomId,
      'user_id': userId,
      'is_admin': isAdmin,
      'joined_at': joinedAt.toIso8601String()
    };
  }
}
