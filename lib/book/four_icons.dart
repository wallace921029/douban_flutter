import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourIcons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Icon(Icons.search),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  shape: new CircleBorder(),
                  onPressed: () {},
                ),
                new Text("找电影", style: new TextStyle(fontSize: 12.0, color: Colors.grey))
              ]
            )
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Icon(Icons.calendar_view_day),
                  color: Colors.orange,
                  textColor: Colors.white,
                  shape: new CircleBorder(),
                  onPressed: () {},
                ),
                new Text("豆瓣榜单", style: new TextStyle(fontSize: 12.0, color: Colors.grey))
              ]
            )
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Icon(Icons.gesture),
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: new CircleBorder(),
                  onPressed: () {},
                ),
                new Text("豆瓣猜", style: new TextStyle(fontSize: 12.0, color: Colors.grey))
              ]
            )
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  child: new Icon(Icons.movie),
                  color: Colors.purple,
                  textColor: Colors.white,
                  shape: new CircleBorder(),
                  onPressed: () {},
                ),
                new Text("豆瓣片单", style: new TextStyle(fontSize: 12.0, color: Colors.grey))
              ]
            )
          )
        ],
      )
    );
  }
}