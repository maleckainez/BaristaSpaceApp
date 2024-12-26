import 'package:choice/choice.dart';
import 'package:dzienniczek_baristy/screens/animations.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/add_screen2.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/brewingmethod.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/slideChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:intl/intl.dart';
import 'package:wheel_slider/wheel_slider.dart';

class AddContent2 extends StatefulWidget{
  @override
  final PageController pageController;
  AddContent2({required this.pageController});
  _AddContent2State createState() => _AddContent2State();
}
class _AddContent2State extends State<AddContent2>{

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(2, 2),
              ),
            ],
            color: Colors.white,
          ),
          width: 350,
          height: 600,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 1,
                  height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2/3",style:
                    TextStyle(
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                    Text("Brew details",style:
                    TextStyle(
                      fontFamily: "RobotoSlab",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,)),
                  ],
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 1,
                  height: 1,),
                SizedBox(height: 10,),
                BrewingMethodChoice(),
                Text("Used brew method", style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 20,),
                SizedBox(
                    width: 300,
                    child: SpinBox(
                  decoration: InputDecoration(hintText: "", suffix: Text("grams        "), border: InputBorder.none, contentPadding: EdgeInsets.zero),
                  min: 1.0,
                  decimals: 1,
                  acceleration: 0.5,
                  max: 50.0,
                  value: 18.0,
                  step: 0.1,
                )),
                SizedBox(height: 0,),
                Text('Amount of used coffee beans', style: TextStyle(fontFamily: "RobotoSlab", fontSize: 12, color: Colors.grey),),
                SizedBox(height: 30,),
                Container(width: 250,
                    child: CustomScaleSlider(minValue: 0, maxValue: 50, initialValue: 25)),

                SizedBox(height: 400,),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shadowColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
                      elevation: MaterialStateProperty.all(5),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.grey, // Kolor tekstu
                          ),
                        ),
                        Icon(Icons.navigate_next, color: Colors.grey), // Ikona z szarym kolorem
                      ],
                    ),
                  )])],
            ),
          ),
        ));

  }
}