import 'package:json_annotation/json_annotation.dart';

import 'contact.dart';

part 'member.g.dart';

@JsonSerializable(explicitToJson: true)
class Member {
  final String? friendId;
  final String? friendStatus;
  final bool isDeleted;
  final bool isModerator;
  final bool isNotifying;
  final Contact contact;
  final DateTime? lastSeenTime;
  final bool isSelected;
  final DateTime? createdTime;
  final DateTime? updatedTime;
  final String id;

  Member({
    this.friendId,
    required this.friendStatus,
    required this.isDeleted,
    required this.isModerator,
    required this.isNotifying,
    required this.contact,
    this.lastSeenTime,
    required this.isSelected,
    this.createdTime,
    this.updatedTime,
    required this.id,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
