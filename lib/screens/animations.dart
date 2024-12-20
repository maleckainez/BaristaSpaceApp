import 'package:flutter/material.dart';

void animatedNavigator(BuildContext context, Widget targetScreen, Offset startOffset) {
Navigator.pushReplacement(context, PageRouteBuilder(
pageBuilder:(context, animation, secondaryAnimation) => targetScreen,
transitionsBuilder: (context, animation, secondaryAnimation, child) {
const end = Offset.zero;
const curve = Curves.easeInOut;
var tween = Tween(begin: startOffset, end: end).chain(CurveTween(curve: curve));
var offsetAnimation = animation.drive(tween);
return SlideTransition(position: offsetAnimation, child: child,);},
transitionDuration: const Duration(seconds: 1),
));}
