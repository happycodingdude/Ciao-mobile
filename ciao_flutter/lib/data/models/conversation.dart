import 'package:json_annotation/json_annotation.dart';

import 'member.dart';

part 'conversation.g.dart'; // <-- Tập tin sẽ được generate

@JsonSerializable(explicitToJson: true)
class Conversation {
  final String id;
  final bool unSeen;
  final String? title;
  final String? avatar;
  final bool isGroup;
  final List<Member> members;
  final String? lastMessageId;
  final String? lastMessage;
  final String? lastMessageContact;
  final bool isNotifying;
  final DateTime? lastMessageTime;
  final DateTime? createdTime;
  final DateTime? updatedTime;

  Conversation({
    required this.id,
    required this.unSeen,
    this.title,
    this.avatar,
    required this.isGroup,
    required this.members,
    this.lastMessageId,
    this.lastMessage,
    this.lastMessageContact,
    required this.isNotifying,
    this.lastMessageTime,
    this.createdTime,
    this.updatedTime,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
