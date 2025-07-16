import 'package:ciao_flutter/data/models/conversation.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  final Conversation conversation;
  final VoidCallback? onTap;

  const ConversationTile({super.key, required this.conversation, this.onTap});

  @override
  Widget build(BuildContext context) {
    final title = conversation.isGroup
        ? (conversation.title ?? 'Không có tiêu đề')
        : conversation.members
              .singleWhere((m) => m.contact.id != '66f270cf9423f7e5257a711e')
              .contact
              .name;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundImage: conversation.avatar != null
                  ? NetworkImage(conversation.avatar!)
                  : null,
              child: conversation.avatar == null
                  ? const Icon(Icons.person)
                  : null,
            ),
            const SizedBox(width: 12),

            // Title + last message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    conversation.lastMessage ?? '',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Optional: Thời gian hoặc biểu tượng
            // const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
