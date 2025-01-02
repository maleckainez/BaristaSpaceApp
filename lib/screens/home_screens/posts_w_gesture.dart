import 'package:dzienniczek_baristy/logics/delete_post_logic.dart';
import 'package:flutter/material.dart';

import '../main_screens/wiki_element.dart';

class PostWGesture extends StatelessWidget {
  final List<Map<String, dynamic>> filteredPosts;
  final VoidCallback onDeleted;

  const PostWGesture({Key? key, required this.filteredPosts,
  required this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        var post = filteredPosts[index];
        return InkWell(
          onTap: () {
            // Navigate to detail page or show post details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(post: post),
              ),
            );
          },
          onLongPress: () {
            // Show menu for edit, modify, preview
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(100, 200, 0, 0),
              items: [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
                PopupMenuItem(
                  value: 'preview',
                  child: Text('Preview'),
                ),
              ],
            ).then((value) {
              var userId = post["user_id"];
              print(userId);
              var postId = post['post_id'];
              print(postId);
              if (value == 'edit') {
                print('Edit selected');
              } else if (value == 'delete') {
                print('Delete selected');
                DeletePostAction(userId, postId);
                onDeleted();
              } else if (value == 'preview') {
                print('Preview selected');
              }
            });
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
              child:
              WikiElement(
                  title: '${(post['brew_method']?.isNotEmpty ?? false) ? post['brew_method'] : 'Coffee'} by user ${(post['user_id'])}',
                  subtitle: ('A brew from ${post['brew_date']}, posted on ${post['published']}' ),
                  description: 'Rating: ${post['rating'] ?? 'N/A'}\nCoffee beans from: ${(post['country_origin']?.isNotEmpty ?? false) ? post['country_origin'] : 'Unknown'} ${post['region']}')



          ),
        );
      },
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: ${post['user_id']}'),
            Text('Rating: ${post['rating']}'),
            Text('Brew Date: ${post['brew_date']}'),
            Text('Brew Method: ${post['brew_method']}'),
          ],
        ),
      ),
    );
  }
}
