import 'package:json_annotation/json_annotation.dart';

import 'ChapterContent.dart';
part 'ChapterContentResult.g.dart';
@JsonSerializable()
class ChapterContentResult{
  ChapterContentResult();
  bool ok;
  ChapterContent chapter;
  factory ChapterContentResult.fromJson(Map<String, dynamic> json) => _$ChapterContentResultFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterContentResultToJson(this);
}