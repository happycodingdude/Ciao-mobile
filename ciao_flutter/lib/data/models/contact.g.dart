// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
  id: json['id'] as String,
  name: json['name'] as String,
  avatar: json['avatar'] as String?,
  bio: json['bio'] as String?,
  isOnline: json['isOnline'] as bool,
);

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar': instance.avatar,
  'bio': instance.bio,
  'isOnline': instance.isOnline,
};
