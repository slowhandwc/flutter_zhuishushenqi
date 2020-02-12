
import 'package:json_annotation/json_annotation.dart';
part 'PostAuthor.g.dart';

@JsonSerializable()
class PostAuthor{
  PostAuthor();
  @JsonKey(name: "_id")
  String id;
  String avatar;
  String nickname;
  String activityAvatar;
  String type;
  int lv;
  String gender;

  factory PostAuthor.fromJson(Map<String, dynamic> json) => _$PostAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$PostAuthorToJson(this);
}