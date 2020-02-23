// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChapterList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterList _$ChapterListFromJson(Map<String, dynamic> json) {
  return ChapterList()
    ..id = json['_id'] as String
    ..name = json['name'] as String
    ..source = json['source'] as String
    ..book = json['book'] as String
    ..link = json['link'] as String
    ..chapters = (json['chapters'] as List)
        ?.map((e) =>
            e == null ? null : Chapter.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChapterListToJson(ChapterList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'source': instance.source,
      'book': instance.book,
      'link': instance.link,
      'chapters': instance.chapters
    };
