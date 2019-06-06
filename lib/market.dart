import 'package:flutter/material.dart';

class Market extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _MarketState();
  }
}

class _MarketState extends State<Market>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("Market"),
      ),
      body: new Center(
        child: new Text("Market"),
      ),
    );
  }
}