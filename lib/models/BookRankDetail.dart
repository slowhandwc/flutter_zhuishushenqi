import 'package:flutter_novel/models/Book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BookRankDetail.g.dart';

@JsonSerializable()
class BookRankDetail{
  BookRankDetail();
  String _id;
  String updated;
  String title;
  String tag;
  String cover;
  String icon;
  String __v;
  String monthRank;
  String totalRank;
  String shortTitle;
  String created;
  String biTag;
  bool isSub;
  bool collapse;
  String gender;
  int priority;
  List<Book> books;

  factory BookRankDetail.fromJson(Map<String, dynamic> json) => _$BookRankDetailFromJson(json);
  Map<String, dynamic> toJson() => _$BookRankDetailToJson(this);
}