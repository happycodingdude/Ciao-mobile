import 'package:ciao_flutter/features/chat/presentation/widgets/conversation_tile.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/conversation.dart';

class ChatTile extends StatelessWidget {
  final Conversation conversation;

  const ChatTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return ConversationTile(
      conversation: conversation,
      onTap: () {
        print('Go to conversation ${conversation.id}');
      },
    );
  }
}
