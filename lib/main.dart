import 'package:chatsapp/presentation/pages/login.dart';
import 'package:chatsapp/presentation/themes/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // <--- Tambahkan ini
import 'firebase_options.dart'; // <--- Tambahkan ini
import 'package:provider/provider.dart';
import 'package:chatsapp/presentation/provider/user_provider.dart';
import 'package:chatsapp/presentation/provider/chatroom_provider.dart';
import 'package:chatsapp/data/repository/chatroom_repository.dart';
import 'package:chatsapp/data/repository/user_repository.dart';
import 'package:chatsapp/data/service/chatroom_service.dart';
import 'package:chatsapp/data/service/user_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- Tambahkan ini
  await Firebase.initializeApp(
    // <--- Tambahkan ini
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              UserProvider(UserRepository(UserService()))
                ..loadUser(), // otomatis load saat provider dibuat
        ),
        ChangeNotifierProvider(
          create: (_) =>
              ChatRoomProvider(ChatRoomRepository(ChatRoomService()))
                ..loadChatRooms(), // otomatis load chatroom
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChatsApp",
      theme: lightmode,
      home: Loginpage(),
    );
  }
}
