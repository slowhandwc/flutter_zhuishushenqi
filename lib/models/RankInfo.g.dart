// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RankInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankInfo _$RankInfoFromJson(Map<String, dynamic> json) {
  return RankInfo()
    ..id = json['_id'] as String
    ..title = json['title'] as String
    ..cover = json['cover'] as String
    ..collapse = json['collapse'] as bool
    ..monthRank = json['monthRank'] as String
    ..totalRank = json['totalRank'] as String
    ..shortTitle = json['shortTitle'] as String;
}

Map<String, dynamic> _$RankInfoToJson(RankInfo instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'collapse': instance.collapse,
      'monthRank': instance.monthRank,
      'totalRank': instance.totalRank,
      'shortTitle': instance.shortTitle
    };
