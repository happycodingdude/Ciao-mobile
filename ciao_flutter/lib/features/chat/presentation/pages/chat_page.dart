import 'package:ciao_flutter/data/network/api_client.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/conversation.dart';
import '../../../../data/repositories/chat_repository.dart';
import '../widgets/chat_tile.dart';

class ChatPage extends StatefulWidget {
  final String title;

  const ChatPage({super.key, required this.title});

  @override
  State<ChatPage> createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ChatPage> {
  late final ChatRepository _repository;
  List<Conversation> conversations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI2NmYyNzBjZjk0MjNmN2U1MjU3YTcxMWUiLCJleHAiOjE3NTI0Mjc3MDAsImlzcyI6Imh0dHBzOi8vY2hhdC5oYXBweWNvZGluZy5jbGljayIsImF1ZCI6Imh0dHBzOi8vY2hhdC5oYXBweWNvZGluZy5jbGljayJ9.9QbQPBgyDR0BehtuKsSmVU1VexnFQKg_ANyIckNLJdw'; // Thường lấy từ secure storage hoặc provider
    final apiClient = ApiClient(token: token);
    _repository = ChatRepository(apiClient: apiClient);

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final result = await _repository.fetchConversations();
      setState(() {
        conversations = result;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return ChatTile(conversation: conversations[index]);
              },
            ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      //   currentIndex: 0,
      //   onTap: (index) {
      //     // Xử lý điều hướng
      //   },
      // ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.home),
            Icon(Icons.chat),
            Icon(Icons.group),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
