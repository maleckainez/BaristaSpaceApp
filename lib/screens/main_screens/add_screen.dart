import 'package:flutter/material.dart';
import '../../logics/brew_data_logic.dart';
import 'add_screens/add_screen1.dart';
import 'add_screens/add_screen2.dart';
import 'add_screens/add_screen3.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
final PageController _PageController = PageController(initialPage: 0);
final BrewData brewData = BrewData();
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          fontFamily: "RobotoSlab",
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey,).copyWith(secondary: Colors.brown,)
        ),
    child: Scaffold(
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
        child: PageView(
          controller: _PageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            AddContent1(pageController: _PageController, brewData: brewData,),
            AddContent2(pageController: _PageController, brewData: brewData,),
            AddContent3(pageController: _PageController, brewData: brewData,),
          ],
        )
      )
    ));
  }
}
