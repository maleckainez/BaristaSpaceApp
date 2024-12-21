import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

Future<void> resetDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'users.db');
  if (await File(path).exists()) {
    await deleteDatabase(path);
    //print('Stara baza danych została usunięta.');
    loadDatabase();
  }
}


Future<Database> loadDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'users.db');
  final exists = await File(path).exists();
  if (!exists){
    try{
      final data = await rootBundle.load('assets/database/users.db');
      final bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes);
    } catch (e){
      // print('BŁĄD: $e');
      }
   } else { // print("db istnieje");// resetDatabase();
  }

  return openDatabase(path);
}

Future<bool> registerNewUser(String name, String email, String hash, String salt) async {
  final db = await loadDatabase();
  try {
    await db.insert(
      'users',
      {
        'fullname': name,
        'email': email,
        'password': hash,
        'permissions': 'user',
        'salt': salt
      },
    );
    return true;
  } catch (e) {
    return false;
  } finally {
    await db.close();
  }
}