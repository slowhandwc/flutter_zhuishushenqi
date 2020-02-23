// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookResource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResource _$BookResourceFromJson(Map<String, dynamic> json) {
  return BookResource()
    ..id = json['_id'] as String
    ..name = json['name'] as String
    ..lastChapter = json['lastChapter'] as String
    ..source = json['source'] as String
    ..link = json['link'] as String
    ..isCharge = json['isCharge'] as bool
    ..chaptersCount = json['chaptersCount'] as num
    ..updated = json['updated'] as String
    ..starting = json['starting'] as bool
    ..host = json['host'] as String;
}

Map<String, dynamic> _$BookResourceToJson(BookResource instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'lastChapter': instance.lastChapter,
      'source': instance.source,
      'link': instance.link,
      'isCharge': instance.isCharge,
      'chaptersCount': instance.chaptersCount,
      'updated': instance.updated,
      'starting': instance.starting,
      'host': instance.host
    };
