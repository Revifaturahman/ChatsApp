import 'package:chatsapp/presentation/pages/addfriends_page.dart';
import 'package:chatsapp/presentation/pages/friends_page.dart';
import 'package:chatsapp/presentation/pages/historychat_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xff00BCD4),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Friends"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Add Pepople"),
      ],
      onTap: (index) => {
        if (index == 0)
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistorychatPage()),
            ),
          }
        else if (index == 1)
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FriendsPage(userId: 'u1')),
            ),
          }
        else if (index == 2)
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddfriendsPage()),
            ),
          },
      },
    );
  }
}
