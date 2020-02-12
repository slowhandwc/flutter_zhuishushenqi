import 'package:json_annotation/json_annotation.dart';

part 'Book.g.dart';

@JsonSerializable()
class Book{
  Book();
  @JsonKey(name: '_id')
  String id;
  String _title;
  String _author;

  String majorCate;
  String minorCate;
  String shortIntro;
  int latelyFollower;
  String retentionRatio;
  double otherReadRatio;

  String _desc;
  String _gender;
  int _collectorCount;
  String _cover;
  int _bookCount;

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  int get collectorCount => _collectorCount;

  set collectorCount(int value) {
    _collectorCount = value;
  }

  String get cover => _cover;

  set cover(String value) {
    _cover = value;
  }

  int get bookCount => _bookCount;

  set bookCount(int value) {
    _bookCount = value;
  }

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}