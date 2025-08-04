class Endpoints {
  static const String baseUrl = 'http://localhost:4000/api';
  static const String apiVersion = 'v1';
  static const String conversations = '$baseUrl/$apiVersion/conversations';
  static const String messages =
      '$baseUrl/$apiVersion/conversations/{id}/messages?page={page}&limit=2';
}
