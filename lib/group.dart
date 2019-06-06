import 'package:flutter/material.dart';

class Group extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _GroupState();
  }
}

class _GroupState extends State<Group>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow,
        title: new Text("Group"),
      ),
      body: new Center(
        child: new Text("Group")
      ),
    );
  }
}