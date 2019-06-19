import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class SearchInput extends StatefulWidget{
  SearchInput({Key key, this.fillColor});

  Color fillColor = Color(0xffdcdcdc);

  @override
  State<StatefulWidget> createState() {
    return new _SearchInputState();
  }
}

class _SearchInputState extends State<SearchInput>{
  File _image;
  
  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TextField(
        decoration: InputDecoration(
          hintText: "我有独特的吵架技巧",
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: GestureDetector(
            child: Icon(Icons.filter_center_focus, color: Colors.grey),
            onTap: _getImage,
          ),
          filled: true,
          fillColor: widget.fillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40.0)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40.0)
          )
        ),
        cursorColor: Color(0xff8a8a8a),
        onTap: () {
          showSearch(
            context: context, 
            delegate: MySearchDelegate()
          );
        },
      )
    );
  }
}

class MySearchDelegate extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FlatButton(
        child: Text("清空"),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Widget> _list = new List<Widget>();
    for(var i = 0; i < 30; i++) {
      _list.add(ListTile(
        title: Text("${query}$i")
      ));
      _list.add(Divider(height: 0));
    }
    return ListView(
      children: _list,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text("热门搜索", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                  ),
                  child: Center(
                    child: Text("黑衣人系列电影", style: TextStyle(color: Colors.orange))
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(">")
              )
            ]
          )
        ),
        Wrap(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      child: Text("1", style: TextStyle(fontSize: 12))
                    ),
                    Text("想我这样节简也", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16))
                  ]
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("借鉴生活指南", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12))
                )
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      child: Text("2", style: TextStyle(fontSize: 12))
                    ),
                    Text("高考志愿", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16))
                  ]
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("高考志愿怎么填？", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12))
                )
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      child: Text("3", style: TextStyle(fontSize: 12))
                    ),
                    Text("毕业旅行", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16))
                  ]
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("不说再见的旅行", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12))
                )
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      child: Text("4", style: TextStyle(fontSize: 12))
                    ),
                    Text("全新奥迪Q2L", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16))
                  ]
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("首付低至1.79万 用供3000", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12))
                )
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      child: Text("5", style: TextStyle(fontSize: 12))
                    ),
                    Text("大小谎言 第二季", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16))
                  ]
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("梅姨加盟 收视飚红", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12))
                )
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      child: Text("6", style: TextStyle(fontSize: 12))
                    ),
                    Text("豆瓣相册", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16))
                  ]
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("与回忆再次相见", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12))
                )
              )
            ),
          ]
        )
      ],
    );
  }
}