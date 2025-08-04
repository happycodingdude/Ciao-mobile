import 'package:ciao_flutter/data/models/conversation.dart';
import 'package:ciao_flutter/data/models/pagination_message.dart';
import 'package:ciao_flutter/data/repositories/chat_repository.dart';
import 'package:ciao_flutter/features/chat/presentation/pages/message_page.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  final ChatRepository repository;
  final Conversation conversation;

  const ConversationTile({
    super.key,
    required this.repository,
    required this.conversation,
  });

  Future<PaginationMessage> getMessages() async {
    try {
      return await repository.fetchMessages(conversation.id);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = conversation.isGroup
        ? (conversation.title ?? 'Không có tiêu đề')
        : conversation.members
              .singleWhere((m) => m.contact.id != '66f270cf9423f7e5257a711e')
              .contact
              .name;

    return InkWell(
      onTap: () async {
        print('Go to conversation ${conversation.id}');

        // Hiển thị loading dialog
        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (_) => const Center(child: CircularProgressIndicator()),
        // );

        try {
          // Fetch messages
          // final messages = await getMessages();

          // Đóng loading dialog
          // Navigator.pop(context);

          // Navigate sang MessagePage
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MessagePage(
                currentUserId: '66f270cf9423f7e5257a711e',
                repository: repository,
                conversationId: conversation.id,
              ),
            ),
          );
        } catch (e) {
          // Đóng loading dialog
          // Navigator.pop(context);

          // Show error snackbar
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Failed to load messages')));
        }
      },

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
