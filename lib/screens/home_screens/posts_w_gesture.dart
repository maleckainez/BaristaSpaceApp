import 'package:flutter/material.dart';

class PostWGesture extends StatelessWidget {
  final List<Map<String, dynamic>> filteredPosts;

  const PostWGesture({Key? key, required this.filteredPosts})
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
                  value: 'modify',
                  child: Text('Modify'),
                ),
                PopupMenuItem(
                  value: 'preview',
                  child: Text('Preview'),
                ),
              ],
            ).then((value) {
              if (value == 'edit') {
                print('Edit selected');
              } else if (value == 'modify') {
                print('Modify selected');
              } else if (value == 'preview') {
                print('Preview selected');
              }
            });
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350),
            child: Card(
              child: ListTile(
                title: Text((post['user_id'] ?? 'Unknown Method').toString()),
                subtitle: Text('Public: ${post['is_public']}'),
                isThreeLine: true,
                dense: true,
                trailing: Text(
                  'Rating: ${post['rating'] ?? 'N/A'}\nBrew Date: ${post['brew_date'] ?? 'Unknown'}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
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
