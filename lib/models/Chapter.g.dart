// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return Chapter()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..link = json['link'] as String
    ..time = json['time'] as num
    ..chapterCover = json['chapterCover'] as String
    ..totalpage = json['totalpage'] as num
    ..partsize = json['partsize'] as num
    ..order = json['order'] as num
    ..currency = json['currency'] as num
    ..unreadble = json['unreadble'] as bool
    ..isVip = json['isVip'] as bool;
}

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'time': instance.time,
      'chapterCover': instance.chapterCover,
      'totalpage': instance.totalpage,
      'partsize': instance.partsize,
      'order': instance.order,
      'currency': instance.currency,
      'unreadble': instance.unreadble,
      'isVip': instance.isVip
    };
