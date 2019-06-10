import 'package:flutter/material.dart';

class Person extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _PersonState();
  }
}

class _PersonState extends State<Person> with SingleTickerProviderStateMixin{
  Color _dynamicColor = Colors.white;
  TabController _tabController;
  List<Widget> _tabs = [
    new Text("影视"),
    new Text("图书"),
    new Text("音乐")
  ];

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xffdcdcdc),
      body: new NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          setState(() {
            if (scrollNotification.context.size.height > scrollNotification.context.size.width) {
              if (scrollNotification.metrics.extentBefore > 80){
                _dynamicColor = Colors.black;
              } else if(scrollNotification.metrics.extentBefore <= 80) {
                _dynamicColor = Colors.white;
              }
            }
          });
        },
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              leading: new Icon(Icons.settings, color: _dynamicColor),
              title: new Text("我的",
                style: new TextStyle(
                  color: _dynamicColor
                )
              ),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.mail),
                  color: _dynamicColor,
                  onPressed: () {}
                )
              ],
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: new FlexibleSpaceBar(
                background: new Container(
                  width: MediaQuery.of(context).size.width,
                  padding: new EdgeInsets.all(16.0),
                  height: 200,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: new NetworkImage("http://img.52z.com/upload/news/image/20171205/20171205122441_67331.jpg"), 
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.grey, BlendMode.darken)
                    )
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                        width: 80,
                        height: 80,
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage("http://img.52z.com/upload/news/image/20171205/20171205122441_67331.jpg"),
                        )
                      ),
                      new Expanded(
                        child: Container(
                          height: 80, 
                          padding: new EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: new Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new Text("Chestnut", style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))
                                  ),
                                  new Text("个人主页 >", style: new TextStyle(color: Colors.white))
                                ]
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text("关注 0", style: new TextStyle(fontSize: 12, color: Colors.white)),
                                  new Padding(
                                    padding: new EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: new Text("被关注 0", style: new TextStyle(fontSize: 12, color: Colors.white))
                                  )
                                ]
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              )
            ),
            // 我的书影音
            new SliverToBoxAdapter(
              child: new Container(
                color: Colors.white,
                margin: new EdgeInsets.fromLTRB(0, 8, 0, 0),
                padding: new EdgeInsets.all(8.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Text("我的书影音", style: new TextStyle(fontWeight: FontWeight.bold))
                    ),
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(4.0),
                      child: new Container(
                        height: 30,
                        width: 120,
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(colors: [Colors.purple, Colors.pink])
                        ),
                        child: new Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            new Positioned(
                              left: 8,
                              child: new Text("书影音档案 / ", style: new TextStyle(color: Colors.white, fontSize: 10.0))
                            ),
                            new Positioned(
                              right: 8,
                              top: 2,
                              child: new Text("5月小结", style: new TextStyle(color: Colors.white, fontSize: 12.0))
                            ),
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            ),
            // 影视、图书、音乐
            new SliverToBoxAdapter(
              child: new Container(
                color: Colors.white,
                padding: new EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // TabBar
                    new Container(
                      width: double.infinity,
                      height: 30,
                      decoration: new BoxDecoration(
                        border: new Border(bottom: new BorderSide(width: 1.0, color: Colors.grey,style: BorderStyle.solid))
                      ),
                      child: new Align(
                        alignment: Alignment.centerLeft,
                        child: new Container(
                          height: 30,
                          width: 200,
                          child: new TabBar(
                            controller: _tabController,
                            tabs: _tabs,
                            labelColor: Colors.black,
                            indicatorColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.label,
                            onTap: (index) {
                              _scrollController.animateTo(
                                index*MediaQuery.of(context).size.width.toDouble(), 
                                duration: Duration(milliseconds: 500), 
                                curve: Curves.ease
                              );
                            }
                          )
                        )
                      )
                    ),
                    // Views
                    NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollNotification) {
                        if (scrollNotification.metrics.pixels < MediaQuery.of(context).size.width) {
                          _tabController.animateTo(0);
                        }
                        if ( MediaQuery.of(context).size.width <= scrollNotification.metrics.pixels && scrollNotification.metrics.pixels < MediaQuery.of(context).size.width*2) {
                          _tabController.animateTo(1);
                        }
                        if ( MediaQuery.of(context).size.width*2 <= scrollNotification.metrics.pixels && scrollNotification.metrics.pixels < MediaQuery.of(context).size.width*3) {
                          _tabController.animateTo(2);
                        }
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        child: Row(
                          children: <Widget>[
                            MovieCoverGroup(
                              list: [
                                Expanded(child: MovieCover(src: "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1762082751,4254581079&fm=58", text: "想看")),
                                Expanded(child: MovieCover(src: "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1762082751,4254581079&fm=58", text: "在看")),
                                Expanded(child: MovieCover(src: "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1762082751,4254581079&fm=58", text: "看过"))
                              ]
                            ),
                            MovieCoverGroup(
                              list: [
                                Expanded(child: MovieCover(src: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=90352328,2560369800&fm=58", text: "想读")),
                                Expanded(child: MovieCover(src: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=90352328,2560369800&fm=58", text: "在读")),
                                Expanded(child: MovieCover(src: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=90352328,2560369800&fm=58", text: "读过"))
                              ]
                            ),
                            MovieCoverGroup(
                              list: [
                                Expanded(child: MovieCover(src: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4063078013,3345903436&fm=58", text: "想听")),
                                Expanded(child: MovieCover(src: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4063078013,3345903436&fm=58", text: "在听")),
                                Expanded(child: MovieCover(src: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4063078013,3345903436&fm=58", text: "听过"))
                              ]
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            )
          ],
        )
      )
    );
  }
}

// 封面
class MovieCover extends StatelessWidget {
  final String src;
  final String text;

  const MovieCover({Key key, this.src, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              src,
              fit: BoxFit.cover, width: 50, height: 50*1.4)
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12.0)
          )
        ]
      )
    );
  }
}

class MovieCoverGroup extends StatelessWidget {
  final List<Widget> list;

  const MovieCoverGroup({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: list
        )
      )
    );
  }
}