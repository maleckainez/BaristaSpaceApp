import 'package:flutter/material.dart';

import '../../logics/register_logic.dart';

Future<List<Map<String, dynamic>>> fetchPosts() async {
  final db = await loadDatabase();
  try {
    final result = await db.rawQuery('''
      SELECT 
        up.user_id, 
        up.rating, 
        up.brew_date, 
        up.brew_method, 
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
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts found.'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.coffee),
                    title: Text('Post by User ID: ${post['user_id'] ?? 'Unknown'}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rating: ${post['rating'] ?? 'No rating'}'),
                        Text('Brew Date: ${post['brew_date'] ?? 'No date'}'),
                        Text('Brew Method: ${post['brew_method'] ?? 'No method'}'),
                        Text('Origin Country: ${post['country_origin'] ?? 'Unknown'}'),
                        Text('Region: ${post['region'] ?? 'Unknown'}'),
                        Text('Processing: ${post['processing'] ?? 'Unknown'}'),
                        Text('Variety: ${post['variety'] ?? 'Unknown'}'),
                        Text('Roast Date: ${post['roast_date'] ?? 'Unknown'}'),
                        Text('Roastery: ${post['roastery'] ?? 'Unknown'}'),
                        Text('Roast Type: ${post['roast_type'] ?? 'Unknown'}'),
                        Text('Farm Altitude: ${post['farm_alt'] ?? 'Unknown'}'),
                        Text('Brew Notes: ${post['brew_notes'] ?? 'None'}'),
                        Text('Brew Coarseness: ${post['coarsness'] ?? 'Unknown'}'),
                        Text('Coffee Weight: ${post['coffee_weight'] ?? 'Unknown'}'),
                        Text('Water Weight: ${post['water_weight'] ?? 'Unknown'}'),
                        Text('Water Temperature: ${post['water_temp'] ?? 'Unknown'}'),
                        Text('Total Time: ${post['total_time'] ?? 'Unknown'}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
