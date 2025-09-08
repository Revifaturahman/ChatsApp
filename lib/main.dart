import 'package:chatsapp/data/repository/chatparticipant_repository.dart';
import 'package:chatsapp/data/repository/friends_repository.dart';
import 'package:chatsapp/data/repository/message_repository.dart';
import 'package:chatsapp/data/service/chatparticipant_service.dart';
import 'package:chatsapp/data/service/friends_service.dart';
import 'package:chatsapp/data/service/message_service.dart';
import 'package:chatsapp/presentation/pages/intoductionscreen_page.dart';
import 'package:chatsapp/presentation/provider/chatparticipant_provider.dart';
import 'package:chatsapp/presentation/provider/friends_provider.dart';
import 'package:chatsapp/presentation/provider/message_provider.dart';
import 'package:chatsapp/presentation/themes/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:chatsapp/presentation/provider/user_provider.dart';
import 'package:chatsapp/presentation/provider/chatroom_provider.dart';
import 'package:chatsapp/data/repository/chatroom_repository.dart';
import 'package:chatsapp/data/repository/user_repository.dart';
import 'package:chatsapp/data/service/chatroom_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(UserRepository())..loadUsers(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              ChatRoomProvider(ChatRoomRepository(ChatRoomService()))
                ..loadChatRooms(),
        ),
        ChangeNotifierProvider(
          create: (_) => MessageProvider(MessageRepository(MessageService())),
        ),
        ChangeNotifierProvider(
          create: (_) => FriendsProvider(FriendsRepository(FriendsService())),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatparticipantProvider(
            ChatparticipantRepository(ChatparticipantService()),
          ),
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
      home: IntroductionScreenPage(),
    );
  }
}
