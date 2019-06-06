import 'package:douban_flutter/book.dart';
import 'package:douban_flutter/group.dart';
import 'package:douban_flutter/home.dart';
import 'package:douban_flutter/market.dart';
import 'package:douban_flutter/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoubanContainer extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _DoubanContainerState();
  }
  
}

class _DoubanContainerState extends State<DoubanContainer>{
  Color _colorGreen = new Color.fromARGB(255, 0, 181, 29);
  List<Widget> bodyLists;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    
    bodyLists = new List<Widget>();
    bodyLists.addAll([
      new Home(),
      new Book(),
      new Group(),
      new Market(),
      new Person()
    ]);
  }
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Douban Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        body: bodyLists[_currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('首页')
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              title: new Text("书影音")
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.group),
              title: new Text("小组")
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.traffic),
              title: new Text("市集")
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("我的")
            )
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _colorGreen,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}