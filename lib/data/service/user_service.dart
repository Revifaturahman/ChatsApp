import 'package:chatsapp/core/utils/api_request.dart';

class UserService {
   final String baseUrl = "https://dummy.api.com/api"; // TODO: ganti nanti

  Future getUsers() async {
    return await sendRequest("$baseUrl/users", method: "GET");
  }

  Future getUserById(String id) async {
    return await sendRequest("$baseUrl/users/$id", method: "GET");
  }

  Future createUser(Map<String, dynamic> body) async {
    return await sendRequest("$baseUrl/users", method: "POST", body: body);
  }
}