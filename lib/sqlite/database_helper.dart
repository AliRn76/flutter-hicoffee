
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:hicoffee2/models/item_model.dart';


class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String tbl_item         = "Item";
  String col_id           = "ID";
  String col_image_url    = "Image_Url";
  String col_name         = "Name";
  String col_category     = "Category";
  String col_description  = "Description";
  String col_number       = "Number";
  String col_price        = "Price";

  DatabaseHelper._CreateInstance();

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._CreateInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hicoffee.db');

    Database database = await openDatabase(path, version: 1, onCreate:  _createDB);
    return database;
    }

  void _createDB(Database db, int version) async{
    await db.execute(
        'CREATE TABLE $tbl_item ('
            '$col_id INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$col_name TEXT, '
            '$col_image_url TEXT, '
            '$col_category TEXT, '
            '$col_description TEXT, '
            '$col_number INTEGER, '
            '$col_price INTEGER)');
  }

  // Fekr Konm Useless Shode In
  Future<List<Map<String, dynamic>>> getItemMapList() async{
    Database db = await this.database;
    var result = await db.query(tbl_item);
    return result;
  }

  // Insert One Item
  Future<List<Map<String, dynamic>>> insertItem(Item item) async{
    Database db = await this.database;
    var result = await db.rawQuery(
      "Insert Into $tbl_item ($col_name, $col_image_url, $col_category, $col_description, $col_number, $col_price)"
          "VALUES ('${item.name}', '${item.image_url}', '${item.category}', '${item.description}', ${item.number}, ${item.price});"
    );
    return result;
  }

  // Delete All Items
  Future<List<Map<String, dynamic>>> deleteItems() async{
    Database db = await this.database;
    var result = await db.rawQuery(
        "Delete From $tbl_item;"
    );
    return result;
  }

  // Delete One Item
  Future<List<Map<String, dynamic>>> deleteItem(Item item) async{
    Database db = await this.database;
    var result = await db.rawQuery(
        "Delete From $tbl_item Where $col_name == '${item.name}';"
    );
    return result;
  }

  // Insert List Of Items
  Future<List<Map<String, dynamic>>> insertListItem(List<Item> items) async{
    Database db = await this.database;
    var result;
    for(int i=0 ; i<items.length; i++){
      result = await db.rawQuery(
          "Insert Into $tbl_item ($col_name, $col_image_url, $col_category, $col_description, $col_number, $col_price)"
              "VALUES ('${items[i].name}', '${items[i].image_url}', '${items[i].category}', '${items[i].description}', ${items[i].number}, ${items[i].price});"
      );
    }
    return result;
  }

  // Select All Items
  Future<List<Map<String, dynamic>>> selectItems() async{
    Database db = await this.database;
    var result = await db.rawQuery(
        "Select * From $tbl_item;"
    );
    return result;
  }

  // Update One Item
  Future<int> updateItem(Item item) async{
    Database db = await this.database;
    var result =await db.update(tbl_item, item.toMap(), where: '$col_name = ?', whereArgs: [item.name]);
    return result;
  }

  // Check For Item Name Is Valid Or Not (False mean You Can Use It)
  Future<bool> checkItemName(String name) async{
    bool condi = false;
    List<String> names = [];
    Database db = await this.database;
    var result = await db.rawQuery(
        "Select Name From $tbl_item;"
    );
    for(int i=0 ; i<result.length ; i++){
      names.add(result[i]["Name"]);
    }
    for(int i=0 ; i<names.length ; i++){
      if (name == names[i]) {
        condi = true;
      }
    }
    return condi;
  }
}