import 'package:dzienniczek_baristy/screens/home_screens/home_public_posts.dart';
import 'package:flutter/material.dart';

import '../home_screens/home_private_posts.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(Colors.grey.value)),
            backgroundColor: Color(0x0d353535),
            title: Text(
              "Home Screen",
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            bottom: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: false,
              indicatorColor: Color(0xFF6F4E37),
              labelColor: Color(0xFF6F4E37),
              unselectedLabelColor: Color(Colors.grey.value),
              labelStyle: TextStyle(
                color: Color(0xFF6F5E37),
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w100,
              ),
              tabs: [
                Container(
                    width: screenWidth/2.5,
                    height: 50,
                    child: Center(child: Text('Explore recepies'))),
                Container(
                    width: screenWidth/2.5,
                    height: 50,
                    child: Center(child: Text('My recepies'))),
              ],
            ),
          ),
          body: Center(
              child: TabBarView(children: [
                Align(child:ConstrainedBox(constraints: BoxConstraints(maxWidth: screenWidth*0.85), child: PublicPostsScreen())),
                Align(child:ConstrainedBox(constraints: BoxConstraints(maxWidth: screenWidth*0.85), child: PrivatePostsScreen())),
                  ]))),
        );
  }
}
