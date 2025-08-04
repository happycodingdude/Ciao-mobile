// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationMessage _$PaginationMessageFromJson(Map<String, dynamic> json) =>
    PaginationMessage(
      hasMore: json['hasMore'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginationMessageToJson(PaginationMessage instance) =>
    <String, dynamic>{
      'hasMore': instance.hasMore,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };
