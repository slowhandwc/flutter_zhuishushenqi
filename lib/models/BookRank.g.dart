// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookRank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRank _$BookRankFromJson(Map<String, dynamic> json) {
  return BookRank()
    ..ok = json['ok'] as bool
    ..male = (json['male'] as List)
        ?.map((e) =>
            e == null ? null : RankInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..female = (json['female'] as List)
        ?.map((e) =>
            e == null ? null : RankInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..picture = (json['picture'] as List)
        ?.map((e) =>
            e == null ? null : RankInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..epub = (json['epub'] as List)
        ?.map((e) =>
            e == null ? null : RankInfo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BookRankToJson(BookRank instance) => <String, dynamic>{
      'ok': instance.ok,
      'male': instance.male,
      'female': instance.female,
      'picture': instance.picture,
      'epub': instance.epub
    };
