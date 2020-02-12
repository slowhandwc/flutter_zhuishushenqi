
import 'package:json_annotation/json_annotation.dart';

import 'RecommendBook.dart';
part 'RecommendBookList.g.dart';

@JsonSerializable()
class RecommendBookList{
  RecommendBookList();
  bool ok;
  List<RecommendBook> books;

  factory RecommendBookList.fromJson(Map<String, dynamic> json) => _$RecommendBookListFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendBookListToJson(this);
}