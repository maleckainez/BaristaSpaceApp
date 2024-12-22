import 'package:flutter/material.dart';

class WikiScreen extends StatefulWidget{
  @override 
  _WikiScreenState createState() => _WikiScreenState();
}
class _WikiScreenState extends State<WikiScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(221590837),
        title: Row(
          children: [
            Text("Wiki for your coffee",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),),
            SizedBox(width: 10,),
            Icon(Icons.favorite_border_rounded,
            color: Colors.grey,),
          ]
      ),),
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}