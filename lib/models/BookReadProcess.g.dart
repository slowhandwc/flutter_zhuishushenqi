// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookReadProcess.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookReadProcess _$BookReadProcessFromJson(Map<String, dynamic> json) {
  return BookReadProcess()
    ..bookId = json['bookId'] as String
    ..readChapterIndex = json['readChapterIndex'] as num
    ..readPageIndex = json['readPageIndex'] as num
    ..lastReadTime = json['lastReadTime'] as String;
}

Map<String, dynamic> _$BookReadProcessToJson(BookReadProcess instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'readChapterIndex': instance.readChapterIndex,
      'readPageIndex': instance.readPageIndex,
      'lastReadTime': instance.lastReadTime
    };
