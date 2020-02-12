import 'package:flutter_novel/models/ShortPostItem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ShortPostList.g.dart';
@JsonSerializable()
class ShortPostList{
  ShortPostList();
  List<ShortPostItem> posts;
  bool ok;
  bool last;

  factory ShortPostList.fromJson(Map<String, dynamic> json) => _$ShortPostListFromJson(json);
  Map<String, dynamic> toJson() => _$ShortPostListToJson(this);
}