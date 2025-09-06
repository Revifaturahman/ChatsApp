import 'package:chatsapp/widgets/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatsapp/presentation/provider/friends_provider.dart';

class FriendsPage extends StatefulWidget {
  final String userId;

  const FriendsPage({super.key, required this.userId});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  void initState() {
    // print("INIT STATE");

    Future.microtask(() {
      Provider.of<FriendsProvider>(
        context,
        listen: false,
      ).loadFriends(widget.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Consumer<FriendsProvider>(
        builder: (context, provider, _) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.friends.isEmpty) {
            return const Center(child: Text("Belum ada teman"));
          }

          return ListView.builder(
            itemCount: provider.friends.length,
            itemBuilder: (context, index) {
              final friend = provider.friends[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text("User: ${friend.friendUserId}"),
                subtitle: Text("Status: ${friend.status}"),
              );
            },
          );
        },
      ),
    );
  }
}
