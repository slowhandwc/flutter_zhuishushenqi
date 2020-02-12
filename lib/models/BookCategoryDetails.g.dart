// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookCategoryDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategoryDetails _$BookCategoryDetailsFromJson(Map<String, dynamic> json) {
  return BookCategoryDetails()
    ..name = json['name'] as String
    ..bookCount = json['bookCount'] as int
    ..monthlyCount = json['monthlyCount'] as int
    ..icon = json['icon'] as String
    ..bookCover = json['bookCover'] as List;
}

Map<String, dynamic> _$BookCategoryDetailsToJson(
        BookCategoryDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bookCount': instance.bookCount,
      'monthlyCount': instance.monthlyCount,
      'icon': instance.icon,
      'bookCover': instance.bookCover
    };
