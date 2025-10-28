import 'package:flutter/material.dart';
import 'package:version_3_22_8/core/domain/model/user.dart';

class ChatListScreen extends StatelessWidget {
  final UserModel user;
  const ChatListScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${user.name}'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text('Chat User $index'),
          subtitle: const Text('Last message preview...'),
          onTap: () {
            // Navigate to chat detail screen
          },
        );
      }))
    );
  }
}
