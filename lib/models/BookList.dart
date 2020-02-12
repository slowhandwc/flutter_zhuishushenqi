import 'package:json_annotation/json_annotation.dart';
import 'Book.dart';
part 'BookList.g.dart';

@JsonSerializable()
class BookList{
  BookList();

  int _total;
  bool _ok;
  List<Book> _bookLists;

  List<Book> get bookLists => _bookLists;

  set bookLists(List<Book> value) {
    _bookLists = value;
  }

  int get total => _total;

  set total(int value) {
    _total = value;
  }

  bool get ok => _ok;

  set ok(bool value) {
    _ok = value;
  }

  factory BookList.fromJson(Map<String, dynamic> json) => _$BookListFromJson(json);
  Map<String, dynamic> toJson() => _$BookListToJson(this);

}