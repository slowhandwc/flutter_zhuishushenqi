// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookList _$BookListFromJson(Map<String, dynamic> json) {
  return BookList()
    ..bookLists = (json['bookLists'] as List)
        ?.map(
            (e) => e == null ? null : Book.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..total = json['total'] as int
    ..ok = json['ok'] as bool;
}

Map<String, dynamic> _$BookListToJson(BookList instance) => <String, dynamic>{
      'bookLists': instance.bookLists,
      'total': instance.total,
      'ok': instance.ok
    };
