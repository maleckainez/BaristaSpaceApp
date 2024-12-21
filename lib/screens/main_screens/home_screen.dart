import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Funkcja ładująca bazę danych
Future<Database> loadDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'users.db');
  return openDatabase(path);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Funkcja pobierająca dane z tabeli `users`
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final db = await loadDatabase();
    try {
      final result = await db.query('users');
      print('Dane pobrane z tabeli users: $result');
      return result;
    } catch (e) {
      print('Błąd podczas pobierania użytkowników: $e');
      return [];
    } finally {
      await db.close(); // Zamknij połączenie
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Users List'),
      //),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(user['fullname'] ?? 'Unknown'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id: ${user ['user_id'] ?? 'No ID'}'),
                        Text('Email: ${user['email'] ?? 'No email'}'),
                        Text('Password: ${user['password'] ?? 'No password'}'),
                        Text('Salt: ${user['salt'] ?? 'No salt'}'),
                        Text('Permissions: ${user['permissions'] ?? 'No permissions'}'),
                        Text('Created Date: ${user['created_date'] ?? 'No date'}'),
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
