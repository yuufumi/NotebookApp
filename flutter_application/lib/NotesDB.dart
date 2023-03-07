import "dart:ffi";

import "package:flutter_application/notesPage.dart";
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import "dart:async";

class note {
  int? id;
  String? title;
  String? content;
  int? favorite;
  note({this.title, this.content, this.favorite});
  note.withId({this.id, this.title, this.content, this.favorite});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = title;
    map["content"] = content;
    map["favorite"] = favorite;
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  note.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.title = o["title"];
    this.content = o["content"];
    this.favorite = int.tryParse(o["unitPrice"].toString());
  }
}

class Sqldb {
  Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "notes.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  FutureOr<void> createDb(Database db, int version) async {
    await db.execute(
        "Create table products(id integer primary key, title text, content text, favorite integer)");
  }

  Future<List> getProducts() async {
    Database? db = await this.db;
    var result = await db!.query("products");
    //return result;
    return List.generate(result.length, (i) {
      return note.fromObject(result[i]);
    });
  }

  Future<int> insert(note note) async {
    Database? db = await this.db;
    var result = await db!.insert("products", note.toMap());
    return result;
  }

  Future<bool> idExist(int id) async {
    Database? db = await this.db;
    var result = await db!.query("products", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty;
  }

  Future<int> delete(int id) async {
    Database? db = await this.db;
    var result = await db!.rawDelete("delete from products where id= $id");
    return result;
  }

  Future<int> update(note note) async {
    Database? db = await this.db;
    var result = await db!
        .update("products", note.toMap(), where: "id=?", whereArgs: [note.id]);
    return result;
  }

  void display() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> rows = await db!.query('products');

    // Print the rows to the console
    for (Map<String, dynamic> row in rows) {
      print(
          '${row['id']} | ${row['title']} | ${row['content']} | ${row['favorite']}');
    }
  }
}
