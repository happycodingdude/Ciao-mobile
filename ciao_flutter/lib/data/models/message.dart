import 'package:ciao_flutter/data/models/attachment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  final String id;
  final String type;
  final String content;
  final bool isPinned;
  final String? pinnedBy;
  final String contactId;
  @JsonKey(defaultValue: [])
  final List<Attachment> attachments;
  final int likeCount;
  final int loveCount;
  final int careCount;
  final int wowCount;
  final int sadCount;
  final int angryCount;
  final String? currentReaction;
  final DateTime createdTime;
  final DateTime? updatedTime;

  Message({
    required this.id,
    required this.type,
    required this.content,
    required this.isPinned,
    this.pinnedBy,
    required this.contactId,
    required this.attachments,
    required this.likeCount,
    required this.loveCount,
    required this.careCount,
    required this.wowCount,
    required this.sadCount,
    required this.angryCount,
    this.currentReaction,
    required this.createdTime,
    this.updatedTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
