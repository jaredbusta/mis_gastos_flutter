// import 'package:sqflite/sqflite.dart';
// import 'animal.dart';
// import 'package:path/path.dart';

class Db {
  // static Future<Database> _openDB() async {
  //   return openDatabase(join(await getDatabasesPath(), 'animales.db'),
  //       onCreate: (db, version) {
  //     return db.execute(
  //         "CREATE TABLE animal(id integer primary key, nombre text, especie text) ");
  //   }, version: 1);
  // }

  // static Future<int> insert(Animal animal) async {
  //   Database database = await _openDB();
  //   return database.insert("animal", animal.toMap());
  // }

  // static Future<int> delete(Animal animal) async {
  //   Database database = await _openDB();
  //   return database.delete("animal", where: "id=?", whereArgs: [animal.id]);
  // }

  // static Future<int> update(Animal animal) async {
  //   Database database = await _openDB();
  //   return database.update("animal", animal.toMap(),
  //       where: "id=?", whereArgs: [animal.id]);
  // }

  // static Future<List<Animal>> getAnimales() async {
  //   Database database = await _openDB();
  //   final List<Map<String, dynamic>> animalesMap =
  //       await database.query("animal");
  //   return List.generate(
  //       animalesMap.length,
  //       (i) => Animal(
  //             id: animalesMap[i]["id"],
  //             nombre: animalesMap[i]["nombre"],
  //             especie: animalesMap[i]["especie"],
  //           ));
  // }
}
