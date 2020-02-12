
import 'package:json_annotation/json_annotation.dart';
part 'ShortPostCount.g.dart';
@JsonSerializable()
class ShortPostCount{
  ShortPostCount();
  bool ok;
  int book;
  int review;
  int shortReview;

  factory ShortPostCount.fromJson(Map<String, dynamic> json) => _$ShortPostCountFromJson(json);
  Map<String, dynamic> toJson() => _$ShortPostCountToJson(this);
}