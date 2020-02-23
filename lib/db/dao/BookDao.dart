import 'package:flutter_zhuishushenqi/db/BaseDbProvider.dart';
import 'package:flutter_zhuishushenqi/models/Book.dart';
import 'package:sqflite/sqflite.dart';

class BookDao extends BaseDbProvider{
  @override
  Map<String, dynamic> tableFields() => <String, dynamic>{
    '_id': 'text primary key',
    'majorCate': 'text',
    'minorCate': 'text',
    'shortIntro': 'text',
    'latelyFollower': 'integer',
    'retentionRatio': 'text',
    'otherReadRatio': 'text',
    'title': 'text',
    'author': 'text',
    'desc': 'text',
    'gender': 'text',
    'collectorCount': 'integer',
    'cover': 'text',
    'bookCount': 'integer',
    'lastChapter':'text'
  };

  @override
  tableName() {
    return 'book_info';
  }

  Future insert(Book book) async {
    Database db = await getDatabase();
    return await db.insert(tableName(), book.toJson());
  }

  Future<Book> getBookById(String id) async {
    Database db = await getDatabase();
    List<Map<String,dynamic>> maps = await  db.query(tableName(),where:  "id = ?",whereArgs: [id]);
    if(maps.length > 0) {
      Book book = Book.fromJson(maps.first);
      return book;
    }
    return null;
  }

  Future<List<Book>> getBookList() async {
    Database db = await getDatabase();
    List<Map<String,dynamic>> maps = await  db.query(tableName());
    if(maps.length > 0) {
      List<Book> bookList = maps.map((item) => Book.fromJson(item)).toList();
      return bookList;
    }
    return null;
  }

}