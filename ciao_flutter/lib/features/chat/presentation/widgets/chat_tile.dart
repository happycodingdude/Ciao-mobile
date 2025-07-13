import 'package:flutter/material.dart';

import '../../../../data/models/conversation.dart';

class ChatTile extends StatelessWidget {
  final Conversation conversation;

  const ChatTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(conversation.title ?? 'No Title'),
      subtitle: Text(conversation.lastMessage ?? 'No messages yet'),
      onTap: () {
        print('Go to conversation ${conversation.id}');
      },
    );
  }
}
