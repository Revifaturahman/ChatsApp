class MessageModel {
  final String messageId;
  final String roomId;
  final String senderId;
  final String? text;
  final String? url;
  final DateTime created_at;
  final bool isRead;

  MessageModel({
    required this.messageId,
    required this.roomId,
    required this.senderId,
    this.text,
    this.url,
    required this.created_at,
    this.isRead = false,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['message_id'],
      roomId: json['room_id'],
      senderId: json['sender_id'],
      text: json['text'],
      url: json['file_url'],
      created_at: DateTime.parse(json['created_at']),
      isRead: json['is_read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'room_id': roomId,
      'sender_id': senderId,
      'text': text,
      'file_url': url,
      'created_at': created_at.toIso8601String(),
      'is_read': isRead,
    };
  }
}
