
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqfliteController with ChangeNotifier {
  static late Database myDatabase;
  List<Map> DatastoringList = [];
  static Future initDb() async {
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
    }
    // open the database
    myDatabase = await openDatabase("storingdata.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE NOTE (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)');
    });
  }

  Future addnotes({
    required name,
    required phone,
  }) async {
    await myDatabase
        .rawInsert('INSERT INTO NOTE (name,phone) VALUES(?,?,?)', [
      name,
      phone,
      
    ]);
    getAllnotes();
    notifyListeners();
  }

  Future getAllnotes() async {
    DatastoringList = await myDatabase.rawQuery('SELECT * FROM NOTE');
    print(DatastoringList);
    notifyListeners();
  }

  // Future removenotes(int id) async {
  //   await myDatabase.rawDelete('DELETE FROM NOTE WHERE id = ?', [id]);
  //   getAllnotes();
  // }

  Future updatenotes(
      String name, String phone,  int? id) async {
    await myDatabase.rawUpdate(
        'UPDATE NOTE SET name = ?, phone = ?, email = ? WHERE id = ?',
        [name, phone, id]);
    getAllnotes();
    notifyListeners();
  }
}
