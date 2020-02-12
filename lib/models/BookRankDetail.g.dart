// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookRankDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRankDetail _$BookRankDetailFromJson(Map<String, dynamic> json) {
  return BookRankDetail()
    ..updated = json['updated'] as String
    ..title = json['title'] as String
    ..tag = json['tag'] as String
    ..cover = json['cover'] as String
    ..icon = json['icon'] as String
    ..monthRank = json['monthRank'] as String
    ..totalRank = json['totalRank'] as String
    ..shortTitle = json['shortTitle'] as String
    ..created = json['created'] as String
    ..biTag = json['biTag'] as String
    ..isSub = json['isSub'] as bool
    ..collapse = json['collapse'] as bool
    ..gender = json['gender'] as String
    ..priority = json['priority'] as int
    ..books = (json['books'] as List)
        ?.map(
            (e) => e == null ? null : Book.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BookRankDetailToJson(BookRankDetail instance) =>
    <String, dynamic>{
      'updated': instance.updated,
      'title': instance.title,
      'tag': instance.tag,
      'cover': instance.cover,
      'icon': instance.icon,
      'monthRank': instance.monthRank,
      'totalRank': instance.totalRank,
      'shortTitle': instance.shortTitle,
      'created': instance.created,
      'biTag': instance.biTag,
      'isSub': instance.isSub,
      'collapse': instance.collapse,
      'gender': instance.gender,
      'priority': instance.priority,
      'books': instance.books
    };
