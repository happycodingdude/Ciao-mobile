// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
  id: json['id'] as String,
  type: json['type'] as String,
  mediaName: json['mediaName'] as String,
  mediaSize: (json['mediaSize'] as num).toInt(),
  mediaUrl: json['mediaUrl'] as String,
  createdTime: DateTime.parse(json['createdTime'] as String),
  updatedTime: json['updatedTime'] == null
      ? null
      : DateTime.parse(json['updatedTime'] as String),
);

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mediaName': instance.mediaName,
      'mediaSize': instance.mediaSize,
      'mediaUrl': instance.mediaUrl,
      'createdTime': instance.createdTime.toIso8601String(),
      'updatedTime': instance.updatedTime?.toIso8601String(),
    };
