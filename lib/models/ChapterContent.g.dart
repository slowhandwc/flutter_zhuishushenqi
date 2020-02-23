// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChapterContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterContent _$ChapterContentFromJson(Map<String, dynamic> json) {
  return ChapterContent()
    ..title = json['title'] as String
    ..body = json['body'] as String
    ..chapterOrder = json['order'] as num
    ..currency = json['currency'] as num
    ..id = json['id'] as String
    ..created = json['created'] as String
    ..updated = json['updated'] as String
    ..cpContent = json['cpContent'] as String
    ..bookId = json['bookId'] as String;
}

Map<String, dynamic> _$ChapterContentToJson(ChapterContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'order': instance.chapterOrder,
      'currency': instance.currency,
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'cpContent': instance.cpContent,
      'bookId': instance.bookId
    };
