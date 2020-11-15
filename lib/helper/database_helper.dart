import 'dart:io' show Directory;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class DatabaseHelper {
  static final _databaseName = "homeate.db";
  static final _databaseVersion = 1;

  static final table = 'tbl_homeate';

  static final columnId = '_id';
  static final columnAuthentication = 'auth';
  static final columnServerUrl = 'url';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnAuthentication TEXT NOT NULL,
            $columnServerUrl TEXT NOT NULL
          )
          ''');
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List> query() async {
    final allRows = await DatabaseHelper.instance.queryAllRows();
    if (allRows.length == 0) {
      return null;
    } else {
      //print('query all rows:');
      allRows.forEach((row) => print(row));
      var getValue = allRows.last.values.toList();

      return getValue;
    }
  }
}
