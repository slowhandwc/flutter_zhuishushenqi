// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookRankDetailResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRankDetailResult _$BookRankDetailResultFromJson(Map<String, dynamic> json) {
  return BookRankDetailResult()
    ..ranking = json['ranking'] == null
        ? null
        : BookRankDetail.fromJson(json['ranking'] as Map<String, dynamic>)
    ..ok = json['ok'] as bool;
}

Map<String, dynamic> _$BookRankDetailResultToJson(
        BookRankDetailResult instance) =>
    <String, dynamic>{'ranking': instance.ranking, 'ok': instance.ok};
