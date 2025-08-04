// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String,
  type: json['type'] as String,
  content: json['content'] as String,
  isPinned: json['isPinned'] as bool,
  pinnedBy: json['pinnedBy'] as String?,
  contactId: json['contactId'] as String,
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  likeCount: (json['likeCount'] as num).toInt(),
  loveCount: (json['loveCount'] as num).toInt(),
  careCount: (json['careCount'] as num).toInt(),
  wowCount: (json['wowCount'] as num).toInt(),
  sadCount: (json['sadCount'] as num).toInt(),
  angryCount: (json['angryCount'] as num).toInt(),
  currentReaction: json['currentReaction'] as String?,
  createdTime: DateTime.parse(json['createdTime'] as String),
  updatedTime: json['updatedTime'] == null
      ? null
      : DateTime.parse(json['updatedTime'] as String),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'content': instance.content,
  'isPinned': instance.isPinned,
  'pinnedBy': instance.pinnedBy,
  'contactId': instance.contactId,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'likeCount': instance.likeCount,
  'loveCount': instance.loveCount,
  'careCount': instance.careCount,
  'wowCount': instance.wowCount,
  'sadCount': instance.sadCount,
  'angryCount': instance.angryCount,
  'currentReaction': instance.currentReaction,
  'createdTime': instance.createdTime.toIso8601String(),
  'updatedTime': instance.updatedTime?.toIso8601String(),
};
