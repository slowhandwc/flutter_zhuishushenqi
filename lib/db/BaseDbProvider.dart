
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhuishushenqi/db/SqliteHelper.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDbProvider{
  bool isTableExits = false;

  tableName();

  Map<String,dynamic> tableFields();

  tableSqlString(){
    var fields = tableFields();
    StringBuffer stringBuffer = StringBuffer();
    fields.forEach((key,value){
      if(stringBuffer.isNotEmpty){
        stringBuffer.write(',');
      }
      stringBuffer.write(key);
      stringBuffer.write(' ');
      stringBuffer.write(value);
    });
    return '''
        create table if not exists ${tableName()} (
          ${stringBuffer.toString()}
        )
    ''';
  }

  Future<Database> getDatabase() async{
    return await open();
  }

  @mustCallSuper
  prepare(name,String createSql) async{
    isTableExits = await SqliteHelper.isTableExists(name);
    if(!isTableExits){
      Database db = await SqliteHelper.db;
      return await db.execute(createSql);
    }
  }

  open() async {
    if(!isTableExits){
      await prepare(tableName(), tableSqlString());
    }
    return await SqliteHelper.db;
  }

  close(){
    SqliteHelper.close();
  }
}