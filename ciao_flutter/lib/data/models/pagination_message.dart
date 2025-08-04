import 'package:json_annotation/json_annotation.dart';
import 'message.dart';

part 'pagination_message.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginationMessage {
  final bool hasMore;
  final List<Message> messages;

  PaginationMessage({
    required this.hasMore,
    required this.messages,
  });

  factory PaginationMessage.fromJson(Map<String, dynamic> json) =>
      _$PaginationMessageFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationMessageToJson(this);
}
