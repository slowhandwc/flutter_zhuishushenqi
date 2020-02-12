// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShortPostCount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortPostCount _$ShortPostCountFromJson(Map<String, dynamic> json) {
  return ShortPostCount()
    ..ok = json['ok'] as bool
    ..book = json['book'] as int
    ..review = json['review'] as int
    ..shortReview = json['shortReview'] as int;
}

Map<String, dynamic> _$ShortPostCountToJson(ShortPostCount instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'book': instance.book,
      'review': instance.review,
      'shortReview': instance.shortReview
    };
