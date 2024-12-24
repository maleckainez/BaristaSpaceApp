import 'package:dzienniczek_baristy/logics/log_in_logic.dart';
import 'package:dzienniczek_baristy/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navbar.dart';

Future<void> loggedInPreference(email, password) async {
  final prefence = await SharedPreferences.getInstance();
  await prefence.setBool("logged_in", true);
  await prefence.setString('email', email);
  await prefence.setString('password', password);
}

Future<void> loggedOutPreference() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

Future<void> isStoredLog(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool("logged_in") ?? false;
  if (isLoggedIn){await isLoginValid(context);}{}
}

Future<void> isLoginValid(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('email') ?? '';
  final password = prefs.getString('password') ?? '';
  final isValid = await passwordValidator(password, email);
  if (isValid) {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navbarMainScreen()));
}}