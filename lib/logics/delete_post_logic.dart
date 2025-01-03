import 'package:dzienniczek_baristy/logics/register_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int?> _getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString('user_id');
  return int.parse(id!);
}

Future<String?> DeletePostAction(int user_id, int post_id) async {
  final db = await loadDatabase();
  if (user_id == null || post_id == null) {
    print('Invalid userId or postId');
  }
  try {
    final currentUserId = await _getUserId();
    if (user_id == currentUserId) {
      final result = await db.rawQuery(
          'DELETE FROM users_post WHERE post_id = ?', [post_id]);
      if (result.isEmpty) {
        return null;
      }
      print(result);
    } else {
      print( Text('UserId is not yours!').toString());
    }
  } finally {
    await db.close();
  }
}
