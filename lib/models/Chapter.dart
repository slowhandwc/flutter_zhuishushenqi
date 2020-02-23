import 'package:json_annotation/json_annotation.dart';
part 'Chapter.g.dart';
@JsonSerializable()
class Chapter{
  Chapter();
  String id;
  String title;
  String link;
  num time;
  String chapterCover;
  num totalpage;
  num partsize;
  num order;
  num currency;
  bool unreadble;
  bool isVip;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);

}