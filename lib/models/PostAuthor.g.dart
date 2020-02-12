// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostAuthor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAuthor _$PostAuthorFromJson(Map<String, dynamic> json) {
  return PostAuthor()
    ..id = json['_id'] as String
    ..avatar = json['avatar'] as String
    ..nickname = json['nickname'] as String
    ..activityAvatar = json['activityAvatar'] as String
    ..type = json['type'] as String
    ..lv = json['lv'] as int
    ..gender = json['gender'] as String;
}

Map<String, dynamic> _$PostAuthorToJson(PostAuthor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'avatar': instance.avatar,
      'nickname': instance.nickname,
      'activityAvatar': instance.activityAvatar,
      'type': instance.type,
      'lv': instance.lv,
      'gender': instance.gender
    };
