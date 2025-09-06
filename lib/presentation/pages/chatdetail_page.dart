import 'package:chatsapp/widgets/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatsapp/presentation/provider/message_provider.dart';

class ChatDetailPage extends StatefulWidget {
  final String roomId;

  const ChatDetailPage({super.key, required this.roomId});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  void initState() {
    super.initState();
    // langsung cek provider
    Future.microtask(() {
      final provider = Provider.of<MessageProvider>(context, listen: false);
      debugPrint("🔍 Load message untuk room: ${widget.roomId}");
      provider.loadMessage(widget.roomId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Consumer<MessageProvider>(
        builder: (context, provider, _) {
          // debugPrint(
          //   "📌 State sekarang -> loading: ${provider.loading}, jumlah message: ${provider.message.length}",
          // );

          // print(provider.loadMessage('r1'));

          if (provider.loading) {
            return const Center(child: Text("Loading...")); // debug text
          }

          if (provider.message.isEmpty) {
            return const Center(child: Text("Belum ada pesan"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.message.length,
            itemBuilder: (context, index) {
              final message = provider.message[index];
              final isMe = message.senderId == "u1";

              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue[100] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(message.text ?? "[file]"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
