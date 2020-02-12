// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookCategories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategories _$BookCategoriesFromJson(Map<String, dynamic> json) {
  return BookCategories()
    ..ok = json['ok'] as bool
    ..male = (json['male'] as List)
        ?.map((e) => e == null
            ? null
            : BookCategoryDetails.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..female = (json['female'] as List)
        ?.map((e) => e == null
            ? null
            : BookCategoryDetails.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..picture = (json['picture'] as List)
        ?.map((e) => e == null
            ? null
            : BookCategoryDetails.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..press = (json['press'] as List)
        ?.map((e) => e == null
            ? null
            : BookCategoryDetails.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BookCategoriesToJson(BookCategories instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'male': instance.male,
      'female': instance.female,
      'picture': instance.picture,
      'press': instance.press
    };
