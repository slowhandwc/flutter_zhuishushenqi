// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChapterContentResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterContentResult _$ChapterContentResultFromJson(Map<String, dynamic> json) {
  return ChapterContentResult()
    ..ok = json['ok'] as bool
    ..chapter = json['chapter'] == null
        ? null
        : ChapterContent.fromJson(json['chapter'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ChapterContentResultToJson(
        ChapterContentResult instance) =>
    <String, dynamic>{'ok': instance.ok, 'chapter': instance.chapter};
