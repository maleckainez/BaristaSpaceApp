import 'package:flutter/material.dart';

class WikiElement extends StatelessWidget {

  final String title;
  final String subtitle;
  final String description;

  WikiElement({
    required this.title,
    required this.subtitle,
    required this.description,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(2, 2), // Przesunięcie cienia
          ),
        ],
        color: Colors.white,
      ),
      width: 350,
      height: 175,
      child: Padding(padding: EdgeInsets.all(30),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            fontFamily: 'RobotoSlab',

          ),),
          SizedBox(height: 5,),
          Text(subtitle,
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 10,
          ),),
          SizedBox(height: 15,),
          Text(description,
          style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 10,
          ),)
        ],
      )),
      ));
  }
}
