import 'package:json_annotation/json_annotation.dart';
part 'BookCategoryDetails.g.dart';

@JsonSerializable()
class BookCategoryDetails{
  BookCategoryDetails();
  String name = "";
  int bookCount = 0;
  int monthlyCount = 0;
  String icon = "";
  var bookCover = [];

  factory BookCategoryDetails.fromJson(Map<String, dynamic> json) => _$BookCategoryDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BookCategoryDetailsToJson(this);
}