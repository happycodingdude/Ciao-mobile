import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final String id;
  final String name;
  final String? avatar;
  final String? bio;
  final bool isOnline;

  Contact({
    required this.id,
    required this.name,
    required this.avatar,
    required this.bio,
    required this.isOnline,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
