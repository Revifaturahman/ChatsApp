class User {
  final String id;
  final String accessToken;
  final String name;
  final int no_phone;
  final String? avatar;

  User({
    required this.id,
    required this.accessToken,
    required this.name,
    required this.no_phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // final userJson = json['user'];
    return User(
      id: json['id'],
      accessToken: json['accessToken'] ?? '',
      name: json['name'],
      no_phone: json['no_phone'] is int
          ? json['no_phone']
          : int.tryParse(json['no_phone'].toString()) ?? 0,
      avatar: json['avatar'],
    );
  }
}
