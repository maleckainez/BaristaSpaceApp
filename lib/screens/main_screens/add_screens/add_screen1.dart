import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dzienniczek_baristy/logics/brew_data_logic.dart';
import 'brewingmethod.dart';

class AddContent1 extends StatefulWidget{
  @override
  final PageController pageController;
  final BrewData brewData;
  AddContent1({required this.pageController, required this.brewData});
  _AddContent1State createState() => _AddContent1State();
}
class _AddContent1State extends State<AddContent1>{
  int selectedRating = 0;
  int rating = 5;
  final date = DateFormat('yyyy-MM-dd').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );


  @override
  String? BrewMethod = '';
  String? BrewDate = '';
  String? OriginCountry = '';
  String? OriginFarm = '';
  String? OriginProcessing = '';
  String? OriginVariety = '';
  String? OriginRoastery = '';
  String? OriginRoastDate = '';
  String? OriginRoastType = '';
  String? OriginFarmAlt = '';
  String? OriginNotes = '';
  Widget build(BuildContext context) {
    BrewDate = date.toString();
    return Center(
    child: SingleChildScrollView(
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
        height: 650,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        ConstrainedBox(constraints: BoxConstraints(maxWidth: 170), child: SizedBox(width: double.infinity, child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(rating, (index) {
                            return IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedRating = index + 1;
                                  //print("Wybrana ocena kawy: $selectedRating");
                                });
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              style: const ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: Icon(
                                Icons.star,
                                color: index < selectedRating ? Colors.amber : Colors.grey,
                              ),
                              iconSize: 32.0,
                            );
                          }),
                        ),),),
                        Text(
                          "Overall Rating",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: "RobotoSlab",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15,),
                        Container(
                            height: 50,
                            width: 180,
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(onPressed: (){
                                    setState(() {
                                      BrewDate = date.toString();
                                    });
                                  },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                                        minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(date, style: TextStyle(
                                          fontFamily: "RobotoSlab",
                                          fontSize: 20, fontWeight: FontWeight.bold,
                                          color: Colors.black),)),
                                  Text("Brew date",
                                    style: TextStyle(
                                      fontFamily: "RobotoSlab",
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),)
                                ]))
                      ],)]
              ),
              SizedBox(height: 10,),
              BrewingMethodChoice(
                onChanged: (value){
                  BrewMethod = value;
                },
              ),
              //Text("Used brew method", style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 20,),
              Divider(
                color: Colors.grey.withOpacity(0.3),
                thickness: 1,
                height: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1/3",style:
                  TextStyle(
                    fontFamily: "RobotoSlab",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                  Text("Origin Details",style:
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

              SizedBox(height: 5,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          OriginCountry = value;
                          //print(OriginCountry);
                        });},
                      decoration: InputDecoration(
                          hintText: "Country of origin",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),
                  SizedBox(width: 30,),
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginFarm = value;});},
                      decoration: InputDecoration(
                          hintText: "Region/ Farm",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),],),
              SizedBox(height: 5,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginProcessing = value;});},
                      decoration: InputDecoration(
                          hintText: "Processing method",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),
                  SizedBox(width: 30,),
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginVariety = value;});},
                      decoration: InputDecoration(
                          hintText: "Botanical variety",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),],),
              SizedBox(height: 5,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginRoastery = value;});},
                      decoration: InputDecoration(
                          hintText: "Roastery",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),
                  SizedBox(width: 30,),
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginRoastDate = value;});},
                      decoration: InputDecoration(
                          hintText: "Roasting date",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),],),
              SizedBox(height: 5,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginRoastType = value;});},
                      decoration: InputDecoration(
                          hintText: "Roast type",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),
                  SizedBox(width: 30,),
                  Flexible(
                    child:
                    TextFormField(
                      onChanged: (value) {setState(() {OriginFarmAlt = value;});},
                      decoration: InputDecoration(
                          hintText: "Farm altitude",
                          constraints: BoxConstraints(),
                          isDense: false,
                          hintStyle: TextStyle(
                              fontFamily: "RobotoSlab",
                              color: Colors.grey,
                              fontSize: 12
                          )
                      ),
                    ),),],),
              SizedBox(height: 5,),
              TextFormField(
                onChanged: (value) {setState(() {OriginNotes = value;});},
                maxLines: 2,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Personal \nnotes",
                    constraints: BoxConstraints(),
                    isDense: false,
                    hintStyle: TextStyle(
                        fontFamily: "RobotoSlab",
                        color: Colors.grey,
                        fontSize: 12
                    )
                ),
              ),
              SizedBox(height: 55,),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  onPressed: () {
                    widget.brewData.selectedRating = selectedRating;
                    widget.brewData.brewDate = BrewDate;
                    widget.brewData.brewMethod = BrewMethod;
                    widget.brewData.originCountry = OriginCountry;
                    widget.brewData.originFarm = OriginFarm;
                    widget.brewData.originProcessing = OriginProcessing;
                    widget.brewData.originVariety = OriginVariety;
                    widget.brewData.originRoastery = OriginRoastery;
                    widget.brewData.originRoastDate = OriginRoastDate;
                    widget.brewData.originRoastType = OriginRoastType;
                    widget.brewData.originFarmAlt = OriginFarmAlt;
                    widget.brewData.originNotes = OriginNotes;

                    //print(widget.brewData);
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