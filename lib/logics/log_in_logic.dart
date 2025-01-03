import 'package:cryptography/cryptography.dart';
import 'dart:convert';
import 'package:dzienniczek_baristy/logics/register_logic.dart';
import 'package:tuple/tuple.dart';

Future<Tuple2<String, String>?> getLoginCredentials(String email) async{
  final db = await loadDatabase();
  try {
    final result = await db.rawQuery(
        'SELECT salt, password FROM users WHERE email = ?', [email]);
    if (result.isEmpty) {
      return null;
    }
    return Tuple2(result.first['salt'] as String,
    result.first['password'] as String);
  } finally {await db.close;}
}

Future<bool> passwordValidator(String password, String email) async {
  final result = await getLoginCredentials(email);
  print(result);
  if (result == null){return false;}
  final dbsalt = result.item1;
  final dbpassword = result.item2;
  final algorithm = Sha256();
  final salted = password + dbsalt;
  final hashed = await algorithm.hash(utf8.encode(salted));
  final hashedPassword = await hashed.bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  //print("Database password: $dbpassword, Salt: $dbsalt, Hashed Input: $hashedPassword");
  return hashedPassword == dbpassword;
}
Future<int?> getUserId(String email) async {
  final db = await loadDatabase();

  try {
    final result = await db.rawQuery(
        'SELECT user_id FROM users WHERE email = ?', [email]
    );

    if (result.isNotEmpty) {
      return result.first['user_id'] as int;
    } else {
      return null;
    }
  } finally {
    await db.close();
  }
}