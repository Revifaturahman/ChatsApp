class User {
  final String accessToken;
  final Map<String, dynamic>? role;

  User({required this.accessToken, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    return User(
      accessToken: json['access_token'],
      role: userJson['role'],
    );
  }
}
