import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int selectedRating = 0; // Aktualnie wybrana liczba gwiazdek
  int rating = 5; // Maksymalna liczba gwiazdek

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(Colors.grey.value)),
        backgroundColor: Color(0x0d353535),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "New coffee registration",
              style: TextStyle(
                fontFamily: "RobotoSlab",
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.auto_graph),
          ],
        ),
      ),
      body: Center(
        child: Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "Import picture \nor take a photo",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "RobotoSlab",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Column(children:[
                    Wrap(
                      alignment: WrapAlignment.center, // Wyśrodkowanie gwiazdek
                      spacing: -15.0, // Odstęp między ikonami
                      children: List.generate(rating, (index) {
                        return IconButton(
                          onPressed: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                          icon: Icon(
                            Icons.star,
                            color: index < selectedRating ? Colors.amber : Colors.grey,
                          ),
                          iconSize: 24.0,
                        );
                      }),
                    ),
                    Text("Rate this coffee",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: "RobotoSlab"
                    ),),
                    Wrap(
                      spacing: 8.0,
                      children: [
                        Icon(Icons.coffee_rounded, color: Colors.grey,),
                        Icon(Icons.coffee_outlined, color: Colors.grey,),
                        Icon(Icons.coffee_maker, color: Colors.grey,),
                        Icon(Icons.star, color: Colors.grey,),
                        Icon(Icons.coffee_outlined, color: Colors.grey,),
                        Icon(Icons.coffee_maker, color: Colors.grey,),

                      ],
                    ),
                      Text("Brewing method",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: "RobotoSlab"
                        ),),
                  ],)]
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    helperText: "Country of Origin"
                  ),
                ),
                //SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      helperText: "Species of coffe"
                  ),
                ),
                //SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      helperText: "Roaster"
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
