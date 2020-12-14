import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:effective_geo/country.dart';

class DatabaseHelper {

  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';
  static final _columnId = '_id';
  static final _columnName = 'name';
  static final _columnCode = 'code';
  static final _columnCapital = 'capital';
  static final _columnContinent = 'continent';
  static final _columnPopulation = 'population';
  static final _columnTime = 'time';
  static final _columnQuality = 'quality';
  static final _columnReps = 'reps';
  static final _columnInterval = 'interval';
  static final _columnEaseFactor = 'easeFactor';
  static final _columnActive = "active";
  static final _columnIdMarker = "id";

  static Database _database;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  bool isNotEmpty(){
    if(database!=null){
      return true;}
    else{
      return false;}
  }


  Future<Database> get database async {
    if (_database != null) return _database;


    _database = await _initiateDatabase();
    return _database;
  }


  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);


    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute('''
    CREATE TABLE $_tableName(
    $_columnId INTEGER PRIMARY KEY,
    $_columnName TEXT NOT NULL,
    $_columnCode TEXT NOT NULL,
    $_columnCapital TEXT NOT NULL,
    $_columnContinent TEXT NOT NULL,
    $_columnPopulation TEXT NOT NULL,
    $_columnTime INTEGER,
    $_columnQuality INTEGER,
    $_columnReps INTEGER,
    $_columnInterval INTEGER ,
    $_columnEaseFactor REAL,
    $_columnActive INTEGER,
    $_columnIdMarker INTEGER)   
    ''');
  }

  Future<int> insert(Map<String, dynamic>row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future <List <Map <String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[_columnId];
    db.update(_tableName, row, where: '$_columnId = ?', whereArgs: [id]);
  }

  Future <int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(
        _tableName, where: '$_columnId = ?', whereArgs: [id]);
  }

}