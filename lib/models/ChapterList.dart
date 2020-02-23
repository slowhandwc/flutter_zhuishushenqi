import 'package:flutter_novel/models/Chapter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ChapterList.g.dart';
@JsonSerializable()
class ChapterList{
  ChapterList();
  @JsonKey(name: '_id')
  String id;
  String name;
  String source;
  String book;
  String link;

  List<Chapter> chapters;

  factory ChapterList.fromJson(Map<String, dynamic> json) => _$ChapterListFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterListToJson(this);

}