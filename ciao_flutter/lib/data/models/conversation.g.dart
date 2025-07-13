// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
  id: json['id'] as String,
  unSeen: json['unSeen'] as bool,
  title: json['title'] as String?,
  avatar: json['avatar'] as String?,
  isGroup: json['isGroup'] as bool,
  members: (json['members'] as List<dynamic>)
      .map((e) => Member.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastMessageId: json['lastMessageId'] as String?,
  lastMessage: json['lastMessage'] as String?,
  lastMessageContact: json['lastMessageContact'] as String?,
  isNotifying: json['isNotifying'] as bool,
  lastMessageTime: json['lastMessageTime'] == null
      ? null
      : DateTime.parse(json['lastMessageTime'] as String),
  createdTime: json['createdTime'] == null
      ? null
      : DateTime.parse(json['createdTime'] as String),
  updatedTime: json['updatedTime'] == null
      ? null
      : DateTime.parse(json['updatedTime'] as String),
);

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unSeen': instance.unSeen,
      'title': instance.title,
      'avatar': instance.avatar,
      'isGroup': instance.isGroup,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'lastMessageId': instance.lastMessageId,
      'lastMessage': instance.lastMessage,
      'lastMessageContact': instance.lastMessageContact,
      'isNotifying': instance.isNotifying,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
      'createdTime': instance.createdTime?.toIso8601String(),
      'updatedTime': instance.updatedTime?.toIso8601String(),
    };
