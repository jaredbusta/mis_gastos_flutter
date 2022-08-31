// import 'package:flutter_vsc_demo/utils/categoria.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class DbSing {
  // static final DbSing instance = DbSing._init();
  // static Database? _database;
  // DbSing._init();

  // Future<Database> get database async {
  //   if (_database != null) return _database!;
  //   _database = await _initDB('mis_gastos.db');
  //   return _database!;
  // }

  // Future<Database> _initDB(String filePath) async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, filePath);
  //   return await openDatabase(path, onCreate: _onCreateDB, version: 2);
  // }

  // Future _onCreateDB(Database db, int version) async {
  //   await db.execute("""create table categoria (
  //     id integer primary key,
  //     nombre text,
  //     color text
  //   )""");
  // }

  // Future<void> insert(Categoria item) async {
  //   final db = await instance.database;
  //   db.insert(item.tablaName, item.toMap());
  // }
}
