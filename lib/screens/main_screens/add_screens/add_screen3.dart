import 'package:dzienniczek_baristy/screens/main_screens/add_screens/slideChart.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/time_spin_box.dart';
import 'package:dzienniczek_baristy/screens/main_screens/add_screens/value_input_widget.dart';
import 'package:flutter/material.dart';


class AddContent2 extends StatefulWidget{
  @override
  final PageController pageController;
  AddContent2({required this.pageController});
  _AddContent2State createState() => _AddContent2State();
}
class _AddContent2State extends State<AddContent2>{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:  Center(
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
                    //SizedBox(height: 10,),
                    //BrewingMethodChoice(),
                    //Text("Used brew method", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    //SizedBox(height: 5,),
                    Divider(
                      color: Colors.grey.withOpacity(0.15),
                      thickness: 1,
                      height: 1,),
                    SizedBox(height: 20,),
                    Container(
                        child: CustomScaleSlider(minValue: 0, maxValue: 50, initialValue: 25)),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.grey.withOpacity(0.15),
                      thickness: 1,
                      height: 1,),
                    AdvancedSpinBox(
                      initialValue: 10,
                      min: 0,
                      max: 200,
                      step: 1,
                      acceleration: 5,
                      unit: 'g',
                      onChanged: (value) {},
                    ),
                    Text('Gramature of coffee used', style: TextStyle(fontFamily: "RobotoSlab", fontSize: 12, color: Colors.grey),),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.grey.withOpacity(0.15),
                      thickness: 1,
                      height: 1,),
                    AdvancedSpinBox(
                      initialValue: 10,
                      min: 0,
                      max: 200,
                      step: 1,
                      acceleration: 5,
                      unit: 'g',
                      onChanged: (value) {},
                    ),
                    Text('Grammature of water used', style: TextStyle(fontFamily: "RobotoSlab", fontSize: 12, color: Colors.grey),),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.grey.withOpacity(0.15),
                      thickness: 1,
                      height: 1,),
                    AdvancedSpinBox(
                      initialValue: 10,
                      min: 0,
                      max: 200,
                      step: 1,
                      acceleration: 5,
                      unit: '°C',
                      onChanged: (value) {},
                    ),
                    Text('Temperature of the water', style: TextStyle(fontFamily: "RobotoSlab", fontSize: 12, color: Colors.grey),),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.grey.withOpacity(0.15),
                      thickness: 1,
                      height: 1,),
                    TimeSpinBox( initialMinutes: 0, initialSeconds: 0),

                    Text('Total time of brew', style: TextStyle(fontFamily: "RobotoSlab", fontSize: 12, color: Colors.grey),),
                    SizedBox(height: 5,),
                    Divider(
                      color: Colors.grey.withOpacity(0.15),
                      thickness: 1,
                      height: 1,),
                    SizedBox(height: 10,),
                    SizedBox(
                        width: 270,
                        child: TextFormField(
                          minLines: 3,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Personal notes\nf.ex. preinfusion",
                            constraints: BoxConstraints(),
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        )),
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