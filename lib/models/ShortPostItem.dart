
import 'package:flutter_novel/models/PostAuthor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ShortPostItem.g.dart';
@JsonSerializable()
class ShortPostItem{
  ShortPostItem();
  @JsonKey(name:"_id")
  String id;
  bool haveImage;
  String state;
  String updated;
  String created;
  int likeCount;
  int commentCount;
  int readCount;
  int rating;
  String title;
  PostAuthor author;
  bool isLike;
  String shareLink;
  String content;
  String type;
  String block;
  String bookId;


  factory ShortPostItem.fromJson(Map<String, dynamic> json) => _$ShortPostItemFromJson(json);
  Map<String, dynamic> toJson() => _$ShortPostItemToJson(this);
}