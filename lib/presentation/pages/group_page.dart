import 'package:chatsapp/widgets/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatsapp/presentation/provider/chatparticipant_provider.dart';

class GroupPage extends StatefulWidget {
  final String roomId;

  const GroupPage({super.key, required this.roomId});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    Future.microtask(() {
      final provider = Provider.of<ChatparticipantProvider>(
        context,
        listen: false,
      );
      debugPrint("load member: ${widget.roomId}");
      provider.loadParticipants(widget.roomId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Consumer<ChatparticipantProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.participants.isEmpty) {
            return const Center(child: Text("Belum ada anggota di room ini"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.participants.length,
            itemBuilder: (context, index) {
              final member = provider.participants[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(member.userId.substring(1).toUpperCase()),
                ),
                title: Text("User: ${member.userId}"),
                subtitle: Text(
                  "Bergabung: ${member.joinedAt.toLocal()}",
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: member.isAdmin
                    ? const Icon(Icons.shield, color: Colors.blue)
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
