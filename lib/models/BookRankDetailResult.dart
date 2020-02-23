import 'package:flutter_zhuishushenqi/models/BookRankDetail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BookRankDetailResult.g.dart';

@JsonSerializable()
class BookRankDetailResult{
  BookRankDetailResult();
  BookRankDetail ranking;
  bool ok;

  factory BookRankDetailResult.fromJson(Map<String, dynamic> json) => _$BookRankDetailResultFromJson(json);
  Map<String, dynamic> toJson() => _$BookRankDetailResultToJson(this);
}