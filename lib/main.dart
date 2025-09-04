import 'package:chatsapp/presentation/pages/login.dart';
import 'package:chatsapp/presentation/themes/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // <--- Tambahkan ini
import 'firebase_options.dart'; // <--- Tambahkan ini

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- Tambahkan ini
  await Firebase.initializeApp(
    // <--- Tambahkan ini
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
