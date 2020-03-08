

import 'dart:io';

import 'package:blood_management/models/hospital.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
class DBHProvider{
  
  static DBHProvider _db;
  DBHProvider._createInstance();

  static Database _database;

  Future<Database> get database async{
    if(_database==null){
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "HospitalData1.db";

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb
    );
    return database;
  }

  void _createDb(Database db,int version) async{
    await db.execute("CREATE TABLE HospitalData1 ("
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

  factory DBHProvider(){
    if(_db==null){
      _db = DBHProvider._createInstance();
    }
    return _db;
  }

  Future<List<Map<String,dynamic>>> displayData() async{
    Database db = await this.database;
    var result = db.query('HospitalData1');
    print(result);
    return result;
  }

  insertData(HospitalData hospital) async{
    Database db = await this.database;
    try{
      db.insert('HospitalData1',hospital.toMap());
    }catch(e){
      print(e.toString());
    }
  }
}