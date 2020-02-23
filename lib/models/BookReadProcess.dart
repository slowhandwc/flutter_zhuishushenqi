import 'package:json_annotation/json_annotation.dart';

part 'BookReadProcess.g.dart';
@JsonSerializable()
class BookReadProcess{
  BookReadProcess();
  String bookId;
  num readChapterIndex;
  num readPageIndex;
  String lastReadTime;

  factory BookReadProcess.fromJson(Map<String, dynamic> json) => _$BookReadProcessFromJson(json);
  Map<String, dynamic> toJson() => _$BookReadProcessToJson(this);
}