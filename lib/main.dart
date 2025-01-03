import 'package:dzienniczek_baristy/logics/sharedpreferences_logic.dart';
import 'package:dzienniczek_baristy/screens/login_screen.dart';
import 'package:dzienniczek_baristy/screens/white_screen.dart';
//import 'package:dzienniczek_baristy/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'logics/register_logic.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barista\'s Notes',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
    ),
      home: WhiteScreen(),
    );
  }
}
