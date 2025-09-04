import 'package:chatsapp/data/models/user_model.dart';
import 'package:chatsapp/data/service/user_service.dart';

class UserRepository {

  // sementara pakai dummy
  final List<Map<String, dynamic>> dummyUsers = [
    {
      "id": "1",
      "accessToken": "token_1",
      "name": "Revi",
      "no_phone": 812345001,
    },
    {
      "id": "2",
      "accessToken": "token_2",
      "name": "Fatur",
      "no_phone": 812345002,
    },
    {
      "id": "3",
      "accessToken": "token_3",
      "name": "Dina",
      "no_phone": 812345003,
    },
    {
      "id": "4",
      "accessToken": "token_4",
      "name": "Andi",
      "no_phone": 812345004,
    },
    {
      "id": "5",
      "accessToken": "token_5",
      "name": "Siti",
      "no_phone": 812345005,
    },
    {
      "id": "6",
      "accessToken": "token_6",
      "name": "Budi",
      "no_phone": 812345006,
    },
    {
      "id": "7",
      "accessToken": "token_7",
      "name": "Rina",
      "no_phone": 812345007,
    },
    {
      "id": "8",
      "accessToken": "token_8",
      "name": "Agus",
      "no_phone": 812345008,
    },
    {
      "id": "9",
      "accessToken": "token_9",
      "name": "Nina",
      "no_phone": 812345009,
    },
    {
      "id": "10",
      "accessToken": "token_10",
      "name": "Rudi",
      "no_phone": 812345010,
    },
  ];

  final UserService service;

  UserRepository(this.service);

  Future<List<User>> getUsers() async {
    // nanti ganti dengan:
    // final response = await service.getUsers();
    // final List data = jsonDecode(response.body);

    return dummyUsers.map((e) => User.fromJson(e)).toList();
  }
}