import 'package:dzienniczek_baristy/logics/register_logic.dart';

Future<List<Map<String, dynamic>>> fetchPosts() async {
  final db = await loadDatabase();
  try {
    final result = await db.rawQuery('''
      SELECT
        up.post_id, 
        up.user_id, 
        up.rating, 
        up.brew_date, 
        up.brew_method,
        up.published,
        up.is_public, 
        pod.country_origin, 
        pod.region, 
        pod.processing, 
        pod.variety, 
        pod.roast_date, 
        pod.roastery, 
        pod.roast_type, 
        pod.farm_alt, 
        pn.origin_notes, 
        pn.brew_notes, 
        bd.coarsness, 
        bd.coffee_weight, 
        bd.water_weight, 
        bd.water_temp, 
        bd.total_time 
      FROM 
        users_post AS up
      LEFT JOIN 
        post_origin_details AS pod ON up.post_id = pod.post_id
      LEFT JOIN 
        post_notes AS pn ON up.post_id = pn.post_id
      LEFT JOIN 
        brew_details AS bd ON up.post_id = bd.post_id
    ''');
    print('Dane pobrane z tabeli posts: $result');
    return result;
  } catch (e) {
    print('Błąd podczas pobierania postów: $e');
    return [];
  } finally {
    await db.close(); // Zamknij połączenie
  }
}