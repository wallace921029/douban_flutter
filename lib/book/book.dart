import 'package:douban_flutter/book/tabview_movie.dart';
import 'package:douban_flutter/book/tabview_tv.dart';
import 'package:douban_flutter/home/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Book extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _BookState();
  }
}

class _BookState extends State<Book> with SingleTickerProviderStateMixin{
  List<Widget> _tabs = new List<Widget>();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Text("电影"),
      new Text("电视"),
      new Text("综艺"),
      new Text("读书"),
      new Text("音乐"),
      new Text("同城"),
    ];
     _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new SearchInput(),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.mail, color: Colors.grey),
            onPressed: (){},
          )
        ],
        elevation: 0,
      ),
      body: new Column(
        children: <Widget>[
          // TabBar 电影、电视、综艺、读书、音乐、同城
          new Container(
            height: 40,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(bottom: new BorderSide(color: new Color(0xffd5d5d5), width: 1.0, style: BorderStyle.solid))
            ),
            child: new TabBar(
              controller: _tabController,
              tabs: _tabs,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
            )
          ),
          // TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                MovieTabView(),
                TvTabView(),
                Text("综艺"),
                Text("读书"),
                Text("音乐"),
                Text("同城")
              ],
            )
          )
        ]
      )
    );
  }
}