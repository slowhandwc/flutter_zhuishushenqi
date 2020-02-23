import 'package:flutter_novel/models/BookReadProcess.dart';
import 'package:sqflite/sqflite.dart';

import '../BaseDbProvider.dart';

class BookReadProcessDao extends BaseDbProvider {
  @override
  Map<String, dynamic> tableFields() => <String, dynamic>{
        'bookId': 'text primary key',
        'readChapterIndex': 'integer',
        'readPageIndex': 'integer',
        'lastReadTime': 'text'
      };

  @override
  tableName() {
    return 'book_read_process';
  }

  Future insert(BookReadProcess readProcess) async {
    Database db = await getDatabase();
    return await db.insert(tableName(), readProcess.toJson());
  }

  Future update(BookReadProcess readProcess) async {
    Database db = await getDatabase();
    return await db.update(tableName(), readProcess.toJson(), where: "bookId = ?", whereArgs: [readProcess.bookId]);
  }

  Future<BookReadProcess> getBookReadProcessByBookId(String bookId) async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query(tableName(), where: "bookId = ?", whereArgs: [bookId]);
    if (maps.length > 0) {
      BookReadProcess readProcess = BookReadProcess.fromJson(maps.first);
      return readProcess;
    }
    return null;
  }

  Future<List<BookReadProcess>> getBookReadProcessList() async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> maps = await db.query(tableName());
    if (maps.length > 0) {
      List<BookReadProcess> bookReadProcessList =
          maps.map((item) => BookReadProcess.fromJson(item)).toList();
      return bookReadProcessList;
    }
    return null;
  }
}
