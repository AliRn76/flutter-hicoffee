
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

createDatabase() async {
  String databasesPath = await getDatabasesPath();
  String dbPath = join(databasesPath, 'my.db');

  Database database = await openDatabase(dbPath, version: 1, onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Item (id INTEGER PRIMARY KEY, '
                'name TEXT, '
                'image_url TEXT, '
                'category TEXT, '
                'description TEXT, '
                'number INTEGER, '
                'price INTEGER)');
      });

  print(database);
  await database.close();

}