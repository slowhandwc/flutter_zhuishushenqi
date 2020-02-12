// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StarRating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarRating _$StarRatingFromJson(Map<String, dynamic> json) {
  return StarRating()
    ..count = json['count'] as int
    ..score = (json['score'] as num)?.toDouble()
    ..tip = json['tip'] as String
    ..isEffect = json['isEffect'] as bool;
}

Map<String, dynamic> _$StarRatingToJson(StarRating instance) =>
    <String, dynamic>{
      'count': instance.count,
      'score': instance.score,
      'tip': instance.tip,
      'isEffect': instance.isEffect
    };
