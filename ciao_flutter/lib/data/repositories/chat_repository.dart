import '../../data/models/conversation.dart';
import '../network/api_client.dart';
import '../network/endpoints.dart';

class ChatRepository {
  final ApiClient apiClient;

  ChatRepository({required this.apiClient});

  Future<List<Conversation>> fetchConversations() async {
    final response = await apiClient.get(Endpoints.conversations);

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => Conversation.fromJson(e))
          .toList();
    } else {
      throw Exception(
        'Failed to load conversations. Status: ${response.statusCode}',
      );
    }
  }
}
