// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecommendBookList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendBookList _$RecommendBookListFromJson(Map<String, dynamic> json) {
  return RecommendBookList()
    ..ok = json['ok'] as bool
    ..books = (json['books'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendBook.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RecommendBookListToJson(RecommendBookList instance) =>
    <String, dynamic>{'ok': instance.ok, 'books': instance.books};
