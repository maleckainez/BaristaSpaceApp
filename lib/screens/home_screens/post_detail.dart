import 'package:dzienniczek_baristy/logics/update_db.dart';
import 'package:dzienniczek_baristy/screens/home_screens/editing_popup.dart';
import 'package:flutter/material.dart';

class PostDetailEdit extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostDetailEdit({Key? key, required this.post}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    final int postId = post['post_id'] as int;
    return Scaffold(
      appBar: AppBar(title: Text('Post Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: ${post['user_id']}',
            style: TextStyle(
              fontSize: 16,
            ),),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Brew rating: ${post['rating']}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){print("tap");} ),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Brew date: ${post['brew_date']}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){print("tapped BrewDate");} ),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Brew method: ${(post['brew_method']?.isNotEmpty ?? false) ? post['brew_method'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){print("tap");} ),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Country of origin: ${(post['country_origin']?.isNotEmpty ?? false) ? post['country_origin'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){showEditDialog(context, post['post_id'] , "Country of coffee origin", post['country_origin'], (newValue) {updatePostColumn('country_origin', newValue, postId);});}),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Region: ${(post['region']?.isNotEmpty ?? false) ? post['region'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){showEditDialog(context, post['post_id'] , "Region of coffee origin", post['region'], (newValue) {updatePostColumn('region', newValue, postId);});}),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Beans processing method: ${(post['processing']?.isNotEmpty ?? false) ? post['processing'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){showEditDialog(context, post['post_id'] , "Processing method", post['processing'], (newValue) {updatePostColumn('processing', newValue, postId);});}),
            SizedBox(height: 10,),
            GestureDetector(
                child: Text('Botanical variety: ${(post['variety']?.isNotEmpty ?? false) ? post['variety'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
                onTap: (){showEditDialog(context, post['post_id'] , "Botanical Variety", post['variety'], (newValue) {updatePostColumn('variety', newValue, postId);});}),

          ],
        ),
      ),
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
            Text('User ID: ${post['user_id']}',
              style: TextStyle(
                fontSize: 16,
              ),),
            SizedBox(height: 10,),
            Text('Brew rating: ${post['rating']}',
                  style: TextStyle(fontSize: 16,),),
            SizedBox(height: 10,),
            Text('Brew date: ${post['brew_date']}',
                  style: TextStyle(fontSize: 16,),),
            SizedBox(height: 10,),
            Text('Brew method: ${(post['brew_method']?.isNotEmpty ?? false) ? post['brew_method'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
            SizedBox(height: 10,),
            Text('Country of origin: ${(post['country_origin']?.isNotEmpty ?? false) ? post['country_origin'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
            SizedBox(height: 10,),
            Text('Region: ${(post['region']?.isNotEmpty ?? false) ? post['region'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,),),
            SizedBox(height: 10,),
            Text('Beans processing method: ${(post['processing']?.isNotEmpty ?? false) ? post['processing'] : 'Not specified'}',
                  style: TextStyle(fontSize: 16,)),
            SizedBox(height: 10,),
            Text('Botanical variety: ${(post['variety']?.isNotEmpty ?? false) ? post['variety'] : 'Not specified'}',style: TextStyle(fontSize: 16,))
          ],
        ),
      ),
    );
  }
}