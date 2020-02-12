
import 'package:json_annotation/json_annotation.dart';
part 'StarRating.g.dart';

@JsonSerializable()
class StarRating{
  StarRating();
  int count;
  double score;
  String tip;
  bool isEffect;

  factory StarRating.fromJson(Map<String, dynamic> json) => _$StarRatingFromJson(json);
  Map<String, dynamic> toJson() => _$StarRatingToJson(this);
}