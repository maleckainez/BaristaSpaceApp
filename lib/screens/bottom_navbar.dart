import 'package:flutter/material.dart';
import 'main_screens/home_screen.dart';
import 'main_screens/profile_screen.dart';
import 'main_screens/wiki_screen.dart';

class navbarMainScreen extends StatefulWidget{
  @override
  _navbarMainScreenState createState() => _navbarMainScreenState();
}

class _navbarMainScreenState extends State<navbarMainScreen>{
  int _obecnyIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    WikiScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_obecnyIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _obecnyIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
          _obecnyIndex = index;
        });},
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

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Screen'));
  }
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add Screen'));
  }
}

