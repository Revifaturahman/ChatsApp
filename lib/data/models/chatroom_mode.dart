class ChatroomModel {
  final String id;
  final String type;
  final DateTime created_at;
  final DateTime update_at;

  ChatroomModel({
    required this.id,
    required this.type,
    required this.created_at,
    required this.update_at
  }) ;

  factory ChatroomModel.fromJson(Map<String, dynamic> json){
    return ChatroomModel(id: json['id'], type: json['type'], created_at: DateTime.parse(json['created_at']), update_at: DateTime.parse(json['updated_at']));
  }
}