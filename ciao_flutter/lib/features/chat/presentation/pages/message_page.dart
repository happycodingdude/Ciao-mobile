import 'package:ciao_flutter/data/models/message.dart';
import 'package:ciao_flutter/data/repositories/chat_repository.dart';
import 'package:ciao_flutter/features/chat/presentation/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final String conversationId;
  final String currentUserId;
  final ChatRepository repository;

  const MessagePage({
    super.key,
    required this.conversationId,
    required this.currentUserId,
    required this.repository,
  });

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  bool isLoading = true;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  Future<void> fetchMessages() async {
    try {
      final result = await widget.repository.fetchMessages(
        widget.conversationId,
      );
      setState(() {
        messages = result.messages;
        isLoading = false;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    } catch (e) {
      print('Error fetching messages: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load messages')));
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent +
            100, // Đẩy xuống thêm 100 cho an toàn
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    print('Sending message: $text');

    // final newMessage = Message(
    //   id: DateTime.now().millisecondsSinceEpoch.toString(),
    //   type: 'text',
    //   content: text,
    //   contactId: widget.currentUserId,
    // );

    // setState(() {
    //   messages.add(newMessage);
    // });

    _textController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    // TODO: Call API to send message here if needed
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      final isMine = msg.contactId == widget.currentUserId;

                      return MessageBubble(message: msg, isMine: isMine);
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
