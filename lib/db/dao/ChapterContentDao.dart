import 'package:flutter_novel/models/ChapterContent.dart';
import 'package:sqflite/sqflite.dart';

import '../BaseDbProvider.dart';

class ChapterContentDao extends BaseDbProvider{
  num chapterOrder;
  num currency;
  String id;
  String created;
  String updated;
  String cpContent;
  String bookId;
  @override
  Map<String, dynamic> tableFields() => <String, dynamic>{
    'id': 'text primary key',
    'title': 'text',
    'body': 'text',
    '[order]': 'integer',
    'created': 'text',
    'updated': 'text',
    'cpContent': 'text',
    'chapterOrder':'integer',
    'currency':'integer',
    'bookId':'text'
  };

  @override
  tableName() {
    return 'chapter_content_save';
  }

  ///插入章节内容
  Future insert(ChapterContent chapterContent) async {
    Database db = await getDatabase();
    return await db.insert(tableName(), chapterContent.toJson());
  }

  ///批量插入章节内容
  Future<List<dynamic>> insertChapterContentList(List<ChapterContent> chapterContentList) async{
    Database db = await getDatabase();
    Batch batch = db.batch();
    for(ChapterContent chapterContent in chapterContentList){
      batch.insert(tableName(),chapterContent.toJson());
    }
    return await batch.commit(
      noResult: true, // 是否关心返回值
      continueOnError: true, // 出现错误是否继续
    );
  }

  ///根据书籍id获取章节内容列表
  Future<List<ChapterContent>> getChapterContentByBookId(String bookId) async {
    Database db = await getDatabase();
    List<Map<String,dynamic>> maps = await  db.query(tableName(),where:  "bookId = ?",whereArgs: [bookId]);
    if(maps.length > 0) {
      List<ChapterContent> contentList = maps.map((item) => ChapterContent.fromJson(item)).toList();
      return contentList;
    }
    List<ChapterContent> emptyList = [];
    return emptyList;
  }

}