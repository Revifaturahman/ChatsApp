import 'package:chatsapp/widgets/main_layout.dart';
import 'package:flutter/material.dart';

class AddfriendsPage extends StatefulWidget {
  const AddfriendsPage({super.key});

  @override
  State<AddfriendsPage> createState() => _AddfriendsPageState();
}

class _AddfriendsPageState extends State<AddfriendsPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(body: Center(child: Text("Add Friend")));
  }
}
