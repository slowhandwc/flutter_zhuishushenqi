
import 'package:json_annotation/json_annotation.dart';
part 'BookResource.g.dart';

@JsonSerializable()
class BookResource{
  BookResource();
  @JsonKey(name:'_id')
  String id;
  String name;
  String lastChapter;
  String source;
  String link;
  bool isCharge;
  num chaptersCount;
  String updated;
  bool starting;
  String host;

  factory BookResource.fromJson(Map<String, dynamic> json) => _$BookResourceFromJson(json);
  Map<String, dynamic> toJson() => _$BookResourceToJson(this);
}