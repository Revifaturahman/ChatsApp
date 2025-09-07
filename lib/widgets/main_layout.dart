import 'package:chatsapp/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  const MainLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AingChat",
          style: TextStyle(
            color: Color(0xff00BCD4),
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'settings') {
                print("setting");
              } else if (value == 'logout') {
                print('logout');
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
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
