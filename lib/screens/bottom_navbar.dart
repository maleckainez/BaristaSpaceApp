import 'package:flutter/material.dart';


class navbarMainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_outlined),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_help_outlined),
            label: "Wiki",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "My profile",
          ),
        ],
      ),
    );
  }
}