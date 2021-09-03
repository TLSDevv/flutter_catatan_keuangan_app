import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseProvider {
  Database? db;

  Future<Null> open() async {
    final databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'keuanganku.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // create table auth
      await db.execute('''
      create table if not exists auth (
        id integer primary key autoincrement,
        user text null,
        email text null,
        auth_token text null,
        refresh_token text null,
        created_at integer,
        updated_at integer
      )
      ''');
    });
  }

  void close() {
    db?.close();
  }
}
