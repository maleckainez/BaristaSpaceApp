import 'package:dzienniczek_baristy/logics/pull_posts.dart';
import 'package:dzienniczek_baristy/screens/main_screens/wiki_element.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PublicPostsScreen extends StatefulWidget {
  @override
  State<PublicPostsScreen> createState() => _PublicPostsScreenState();
}

Future<int?> _getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString('user_id');
  return int.parse(id!);
}

class _PublicPostsScreenState extends State<PublicPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No posts found.'));
        } else {
          return FutureBuilder<int?>(
          future: _getUserId(),
          builder: (context, userIdsnapshot){
            if (userIdsnapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error"),);
            } else {
              int? user_id = userIdsnapshot.data;
              print('user_id to $user_id');

              List<Map<String, dynamic>> filteredPosts = [];
              filteredPosts.addAll(snapshot.data!.where((post) {
                return post['is_public'] == 1; // || post['user_id'] == user_id;
              }).toList());
              if (filteredPosts.isEmpty){
                return const Center(child: Text("No post yet"),);
              }
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16,),
                itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                  var post = filteredPosts[index];
                  return ConstrainedBox(constraints: BoxConstraints(maxWidth: 350),
                  child:
                    WikiElement(
                    title: (post['user_id'] ?? 'Unknown Method').toString(),
                    subtitle: ('Public: ${post['is_public']}' ),
                    description: 'Rating: ${post['rating'] ?? 'N/A'}\nBrew Date: ${post['brew_date'] ?? 'Unknown'}')
                    ,);} );
            }});
    }});
    }
  }