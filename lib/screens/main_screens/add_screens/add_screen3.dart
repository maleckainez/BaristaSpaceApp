import 'package:dzienniczek_baristy/logics/new_post_logic.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/slideChart.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/time_spin_box.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/value_input_widget.dart';
import 'package:flutter/material.dart';

import '../../../logics/brew_data_logic.dart';


class AddContent3 extends StatefulWidget{
  @override
  final PageController pageController;
  final BrewData brewData;
  AddContent3({required this.pageController,required this.brewData});
  _AddContent3State createState() => _AddContent3State();
}
class _AddContent3State extends State<AddContent3>{

  @override
  Widget build(BuildContext context) {
    return Center(
        child:  SingleChildScrollView(
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
              height: 650,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 1,
                      height: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("3/3",style:
                        TextStyle(
                          fontFamily: "RobotoSlab",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                        Text("Sensory details",style:
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
                    SizedBox(height: 20,),

                    SizedBox(height: 70,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      ElevatedButton(
                        onPressed: () {

                          widget.pageController.previousPage(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.navigate_before, color: Colors.grey),
                            Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AddNewPost(widget.brewData);
                          print(widget.brewData.toString());
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
            )));

  }
}