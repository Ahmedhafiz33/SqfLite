import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'snappy.db');
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('_onUpgrade =================================');
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE 'notes' (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "note" TEXT NOT NULL
)
''');
    print('_onCreate =================================');
  }

  // Database'ten  bilgi getirmek
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

// Database'e  bilgi eklemek
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  // Database'ten  bilgi düzenleme
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

// Database'ten  bilgi silmek
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
