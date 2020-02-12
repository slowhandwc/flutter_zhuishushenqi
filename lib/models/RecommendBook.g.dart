// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecommendBook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendBook _$RecommendBookFromJson(Map<String, dynamic> json) {
  return RecommendBook()
    ..id = json['_id'] as String
    ..majorCate = json['majorCate'] as String
    ..minorCate = json['minorCate'] as String
    ..shortIntro = json['shortIntro'] as String
    ..latelyFollower = json['latelyFollower'] as int
    ..retentionRatio = (json['retentionRatio'] as num)?.toDouble()
    ..otherReadRatio = (json['otherReadRatio'] as num)?.toDouble()
    ..title = json['title'] as String
    ..author = json['author'] as String
    ..desc = json['desc'] as String
    ..gender = json['gender'] as String
    ..collectorCount = json['collectorCount'] as int
    ..cover = json['cover'] as String
    ..bookCount = json['bookCount'] as int;
}

Map<String, dynamic> _$RecommendBookToJson(RecommendBook instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'majorCate': instance.majorCate,
      'minorCate': instance.minorCate,
      'shortIntro': instance.shortIntro,
      'latelyFollower': instance.latelyFollower,
      'retentionRatio': instance.retentionRatio,
      'otherReadRatio': instance.otherReadRatio,
      'title': instance.title,
      'author': instance.author,
      'desc': instance.desc,
      'gender': instance.gender,
      'collectorCount': instance.collectorCount,
      'cover': instance.cover,
      'bookCount': instance.bookCount
    };
