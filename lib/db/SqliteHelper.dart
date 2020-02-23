import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper{
  static const int _VERSION = 1;
  static const String _DBName = 'flutter_zssq.db';
  static Database _db;

  SqliteHelper.internal();

  static Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  ///初始化数据库
  static initDb() async{
    String databasePath = await getDatabasesPath();
    final Future<Database> database = openDatabase(
      // Set the path to the database.
      join(databasePath, _DBName),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // 数据库升级
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: _VERSION,
    );
    return database;
  }

  ///判断表是否存在
  static isTableExists(String tableName) async{
    await db;
    String sql = "select * from Sqlite_master where type = 'table' and name = '$tableName' ";
    var res = await _db.rawQuery(sql);
    return res != null && res.length > 0 ;
  }

  ///关闭数据库
  static close(){
    _db?.close();
    _db = null;
  }

}