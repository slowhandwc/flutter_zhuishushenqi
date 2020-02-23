
import 'package:flutter_zhuishushenqi/models/BookCategoryDetails.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BookCategories.g.dart';

@JsonSerializable()
class BookCategories {
  BookCategories();
  bool ok = false;
  List<BookCategoryDetails> male;
  List<BookCategoryDetails> female;
  List<BookCategoryDetails> picture;
  List<BookCategoryDetails> press;

  factory BookCategories.fromJson(Map<String, dynamic> json) => _$BookCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$BookCategoriesToJson(this);
}
