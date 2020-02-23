import 'package:json_annotation/json_annotation.dart';

part 'ChapterContent.g.dart';
@JsonSerializable()
class ChapterContent{
  ChapterContent();
  String title;
  String body;
  @JsonKey(name: 'order')
  num chapterOrder;
  num currency;
  String id;
  String created;
  String updated;
  String cpContent;
  String bookId;


  factory ChapterContent.fromJson(Map<String, dynamic> json) => _$ChapterContentFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterContentToJson(this);

  @override
  bool operator ==(other) {
    if(other is ChapterContent){
      if(id == other.id){
        return true;
      }
    }
    return false;
  }
}