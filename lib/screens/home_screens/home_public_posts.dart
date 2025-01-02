import 'package:dzienniczek_baristy/logics/pull_posts.dart';
import 'package:dzienniczek_baristy/screens/home_screens/posts_w_gesture.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicPostsScreen extends StatefulWidget {
  @override
  State<PublicPostsScreen> createState() => _PublicPostsScreenState();
}

class _PublicPostsScreenState extends State<PublicPostsScreen> {
  late Future<List<Map<String, dynamic>>> postFuture;

  @override
  void initState() {
    super.initState();
    postFuture = _fetchPostsWithUserId();
  }

  Future<List<Map<String, dynamic>>> _fetchPostsWithUserId() async {
    final userId = await _getUserId();
    final posts = await fetchPosts();

    // Filter posts based on conditions
    return posts.where((post) => post['is_public'] == 1 /* || post['user_id'] == userId */).toList();
  }

  void postRefresh() {
    setState(() {
      postFuture = _fetchPostsWithUserId();
    });
  }

  Future<int?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('user_id');
    return id != null ? int.tryParse(id) : null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: postFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No posts found.'));
        } else {
          final filteredPosts = snapshot.data!;
          return PostWGesture(
            filteredPosts: filteredPosts,
            onDeleted: postRefresh,
          );
        }
      },
    );
  }
}
