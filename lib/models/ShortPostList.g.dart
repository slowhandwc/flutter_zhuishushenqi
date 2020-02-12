// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShortPostList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortPostList _$ShortPostListFromJson(Map<String, dynamic> json) {
  return ShortPostList()
    ..posts = (json['posts'] as List)
        ?.map((e) => e == null
            ? null
            : ShortPostItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..ok = json['ok'] as bool
    ..last = json['last'] as bool;
}

Map<String, dynamic> _$ShortPostListToJson(ShortPostList instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'ok': instance.ok,
      'last': instance.last
    };
