import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable()
class Attachment {
  final String id;
  final String type;
  final String mediaName;
  final int mediaSize;
  final String mediaUrl;
  final DateTime createdTime;
  final DateTime? updatedTime;

  Attachment({
    required this.id,
    required this.type,
    required this.mediaName,
    required this.mediaSize,
    required this.mediaUrl,
    required this.createdTime,
    this.updatedTime,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
