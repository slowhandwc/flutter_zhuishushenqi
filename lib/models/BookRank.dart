import 'package:flutter_novel/models/RankInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BookRank.g.dart';

@JsonSerializable()
class BookRank {
  BookRank();
  bool ok = false;
  List<RankInfo> male;
  List<RankInfo> female;
  List<RankInfo> picture;
  List<RankInfo> epub;

  factory BookRank.fromJson(Map<String, dynamic> json) => _$BookRankFromJson(json);
  Map<String, dynamic> toJson() => _$BookRankToJson(this);
}
