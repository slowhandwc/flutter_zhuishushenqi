import 'package:json_annotation/json_annotation.dart';
part 'RankInfo.g.dart';

@JsonSerializable()
class RankInfo{
  RankInfo();
  @JsonKey(name: '_id')
  String id;
  String title;
  String cover;
  bool collapse = false;
  String monthRank;
  String totalRank;
  String shortTitle;

  factory RankInfo.fromJson(Map<String, dynamic> json) => _$RankInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RankInfoToJson(this);
}