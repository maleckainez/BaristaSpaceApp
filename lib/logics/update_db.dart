import 'register_logic.dart';

Future<bool> updatePostColumn(String column, String value, int postId) async {
  final db = await loadDatabase();

  const columnMap = {
    // users_post
    'user_id': 'users_post',
    'rating': 'users_post',
    'brew_date': 'users_post',
    'brew_method': 'users_post',
    'published': 'users_post',
    'is_public': 'users_post',
    // post_origin_details
    'country_origin': 'post_origin_details',
    'region': 'post_origin_details',
    'processing': 'post_origin_details',
    'variety': 'post_origin_details',
    'roast_date': 'post_origin_details',
    'roastery': 'post_origin_details',
    'roast_type': 'post_origin_details',
    'farm_alt': 'post_origin_details',
    // post_notes
    'origin_notes': 'post_notes',
    'brew_notes': 'post_notes',
    // brew_details
    'coarsness': 'brew_details',
    'coffee_weight': 'brew_details',
    'water_weight': 'brew_details',
    'water_temp': 'brew_details',
    'total_time': 'brew_details',
  };

  final tableName = columnMap[column];
  if (tableName == null) {
    print('$column nie ma nigdzie');
    return false;
  }

  try {
    final result = await db.rawUpdate(
      'UPDATE $tableName SET $column = ? WHERE post_id = ?',
      [value, postId],
    );

    if (result > 0) {
      print('updatowano $result wierszy w kolumnie.');
      return true;
    } else {
      print('Nie zupdatowano kolumny');
      return false;
    }
  } catch (e) {
    print('Error $e');
    return false;
  } finally {
    await db.close();
  }
}
