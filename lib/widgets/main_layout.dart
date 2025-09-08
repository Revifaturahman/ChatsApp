import 'package:chatsapp/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatsapp/presentation/pages/login.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  const MainLayout({super.key, required this.body});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AingChat",
          style: TextStyle(
            color: Color(0xff00BCD4),
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'settings') {
                print("setting");
              } else if (value == 'logout') {
                _logout(context); // ✅ Panggil fungsi logout
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: "settings", child: Text("Pengaturan")),
              const PopupMenuItem(value: "logout", child: Text("Logout")),
            ],
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
