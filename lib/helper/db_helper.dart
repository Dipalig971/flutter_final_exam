import 'package:flutter_final_exam/modal/contact_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DataBaseHelper {
  static DataBaseHelper dbHelper = DataBaseHelper._();
  DataBaseHelper._();

  Database? _database;

  Future<Database?> get db async {
    if (_database != null) return _database!;
    _database = await createData();
    return _database!;
  }

  // CREATE
  Future<Database?> createData() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, "contact.db");

    _database = await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      String sql = '''
      CREATE TABLE item(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      )
      ''';
      db.execute(sql);
    });
    return _database;
  }

  // INSERT
  Future<void> insertData(ContactModal contactModel) async {
    final dbClient = await db;
    await dbClient!.insert('contact', contactModel.fromMap());
  }

  // UPDATE
  Future<void> updateData(ContactModal contactModel) async {
    final dbClient = await db;
    await dbClient!.update(
      'contact',
      contactModel.fromMap(),
      where: 'id = ?',
      whereArgs: [contactModel.id],
    );
  }

  // DELETE
  Future<void> deleteData(int id) async {
    final dbClient = await db;
    await dbClient!.delete(
      'contact',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // READ
  Future<List<ContactModal>> getItem() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('contact');

    return List.generate(maps.length, (index) {
      return ContactModal.fromMap(maps[index]);
    });
  }
}
