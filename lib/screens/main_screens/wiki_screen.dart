import 'package:dzienniczek_baristy/screens/main_screens/wiki_element.dart';
import 'package:flutter/material.dart';

class WikiScreen extends StatefulWidget {
  @override
  _WikiScreenState createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Liczba zakładek
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(Colors.grey.value)),
          backgroundColor: Color(0x0d353535),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Expand your knowledge",
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.coffee_outlined,
                color: Colors.grey,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("object");
              },
              icon: Icon(Icons.search),
              tooltip: "Search through wiki",
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.category_outlined),
              tooltip: "Change category",
            ),
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Color(0xFF6F4E37),
            labelColor: Color(0xFF6F4E37),
            unselectedLabelColor: Color(Colors.grey.value),
            labelStyle: TextStyle(
              color: Color(0xFF6F5E37),
              fontFamily: 'RobotoSlab',
              fontWeight: FontWeight.w100,
            ),
            tabs: [
              Tab(text: 'Category 1'),
              Tab(text: 'Category 2'),
              Tab(text: 'Category 3'),
              Tab(text: 'Category 4'),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                WikiElement(title: "Water", subtitle: "Learn how important water can be.", description: "Lorem Ipsum",),
                SizedBox(height: 20),
                WikiElement(title: "Water", subtitle: "Learn how important water can be.", description: "Lorem Ipsum",),
                SizedBox(height: 20),
                WikiElement(title: "Water", subtitle: "Learn how important water can be.", description: "Lorem Ipsum",),
                SizedBox(height: 20),
                WikiElement(title: "Water", subtitle: "Learn how important water can be.", description: "Lorem Ipsum",),
                SizedBox(height: 20),
              ],
            ),),
            Center(child: Text('Content for Category 2')),
            Center(child: Text('Content for Category 3')),
            Center(child: Text('Content for Category 4')),
          ],
        )),
    );
  }
}
