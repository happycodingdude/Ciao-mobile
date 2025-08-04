import 'package:ciao_flutter/data/models/message.dart';
import 'package:ciao_flutter/data/models/pagination_message.dart';

import '../../data/models/conversation.dart';
import '../network/api_client.dart';
import '../network/endpoints.dart';

class ChatRepository {
  final ApiClient apiClient;

  ChatRepository({required this.apiClient});

  Future<List<Conversation>> fetchConversations() async {
    final response = await apiClient.get(Endpoints.conversations);

    if (response.statusCode == 200) {
      // Dành cho API trả về dạng mảng
      return (response.data as List)
          .map((e) => Conversation.fromJson(e))
          .toList();
    } else {
      throw Exception(
        'Failed to load conversations. Status: ${response.statusCode}',
      );
    }
  }
  
  Future<PaginationMessage> fetchMessages(String conversationId) async {
    final response = await apiClient.get(Endpoints.messages
        .replaceFirst('{id}', conversationId)
        .replaceFirst('{page}', '1')
        .replaceFirst('{limit}', '10'));

    if (response.statusCode == 200) {
      // Dành cho API trả về dạng đối tượng
      final data = response.data as Map<String, dynamic>;
      return PaginationMessage.fromJson(data);
    } else {
      throw Exception(
        'Failed to load messages. Status: ${response.statusCode}',
      );
    }
  }
}
