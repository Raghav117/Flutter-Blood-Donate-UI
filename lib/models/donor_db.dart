

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'donor.dart';

class DBProvider{
  
  static DBProvider _db;
  DBProvider._createInstance();

  static Database _database;

  Future<Database> get database async{
    if(_database==null){
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "DonorData1.db";

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb
    );
    return database;
  }

  void _createDb(Database db,int version) async{
    await db.execute("CREATE TABLE DonorData1 ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT,"
          "email TEXT,"
          "address TEXT,"
          "bg TEXT,"
          "dob TEXT,"
          "gender TEXT,"
          "no TEXT"
          ")");
  }

  factory DBProvider(){
    if(_db==null){
      _db = DBProvider._createInstance();
    }
    return _db;
  }

  Future<List<Map<String,dynamic>>> displayData() async{
    Database db = await this.database;
    var result = db.query('DonorData1');
    print(result);
    return result;
  }

  insertData(DonorData donor) async{
    Database db = await this.database;
    try{
      db.insert('DonorData1',donor.toMap());
    }catch(e){
      print(e.toString());
    }
  }
}