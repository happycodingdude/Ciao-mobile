// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
  friendId: json['friendId'] as String?,
  friendStatus: json['friendStatus'] as String?,
  isDeleted: json['isDeleted'] as bool,
  isModerator: json['isModerator'] as bool,
  isNotifying: json['isNotifying'] as bool,
  contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
  lastSeenTime: json['lastSeenTime'] == null
      ? null
      : DateTime.parse(json['lastSeenTime'] as String),
  isSelected: json['isSelected'] as bool,
  createdTime: json['createdTime'] == null
      ? null
      : DateTime.parse(json['createdTime'] as String),
  updatedTime: json['updatedTime'] == null
      ? null
      : DateTime.parse(json['updatedTime'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
  'friendId': instance.friendId,
  'friendStatus': instance.friendStatus,
  'isDeleted': instance.isDeleted,
  'isModerator': instance.isModerator,
  'isNotifying': instance.isNotifying,
  'contact': instance.contact.toJson(),
  'lastSeenTime': instance.lastSeenTime?.toIso8601String(),
  'isSelected': instance.isSelected,
  'createdTime': instance.createdTime?.toIso8601String(),
  'updatedTime': instance.updatedTime?.toIso8601String(),
  'id': instance.id,
};
