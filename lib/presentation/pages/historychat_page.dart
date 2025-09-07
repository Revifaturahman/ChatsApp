import 'package:chatsapp/widgets/main_layout.dart';
import 'package:flutter/material.dart';

class HistorychatPage extends StatefulWidget {
  const HistorychatPage({super.key});

  @override
  State<HistorychatPage> createState() => _HistorychatPageState();
}

class _HistorychatPageState extends State<HistorychatPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(body: Center(child: Text("Chat")));
  }
}
