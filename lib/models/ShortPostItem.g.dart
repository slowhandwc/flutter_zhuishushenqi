// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShortPostItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortPostItem _$ShortPostItemFromJson(Map<String, dynamic> json) {
  return ShortPostItem()
    ..id = json['_id'] as String
    ..haveImage = json['haveImage'] as bool
    ..state = json['state'] as String
    ..updated = json['updated'] as String
    ..created = json['created'] as String
    ..likeCount = json['likeCount'] as int
    ..commentCount = json['commentCount'] as int
    ..readCount = json['readCount'] as int
    ..rating = json['rating'] as int
    ..title = json['title'] as String
    ..author = json['author'] == null
        ? null
        : PostAuthor.fromJson(json['author'] as Map<String, dynamic>)
    ..isLike = json['isLike'] as bool
    ..shareLink = json['shareLink'] as String
    ..content = json['content'] as String
    ..type = json['type'] as String
    ..block = json['block'] as String
    ..bookId = json['bookId'] as String;
}

Map<String, dynamic> _$ShortPostItemToJson(ShortPostItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'haveImage': instance.haveImage,
      'state': instance.state,
      'updated': instance.updated,
      'created': instance.created,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'readCount': instance.readCount,
      'rating': instance.rating,
      'title': instance.title,
      'author': instance.author,
      'isLike': instance.isLike,
      'shareLink': instance.shareLink,
      'content': instance.content,
      'type': instance.type,
      'block': instance.block,
      'bookId': instance.bookId
    };
