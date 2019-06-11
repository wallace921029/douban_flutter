import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:douban_flutter/home/publish_page.dart';
import 'package:douban_flutter/home/recommend_card.dart';
import 'package:douban_flutter/home/search_input.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  Color _colorGreen = new Color.fromARGB(255, 0, 181, 29);

  TabController _tabController;
  List<Widget> tabs = [
    new Text("动态"), 
    new Text("推荐")
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 2,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: _colorGreen,
        title: new SearchInput(fillColor: Colors.white),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.mail),
            onPressed: (){},
          )
        ]
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            padding: new EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/4, 0.0, MediaQuery.of(context).size.width/4, 0.0),
            height: 40.0,
            decoration: BoxDecoration(
              border: new Border(
                bottom: new BorderSide(
                  color: new Color.fromARGB(255, 213, 213, 213), 
                  width: 1.0
                )
              ),
            ),
            child:new TabBar(
              controller: _tabController,
              tabs: tabs,
              indicatorColor: _colorGreen,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: _colorGreen,
              unselectedLabelColor: Colors.grey,
            )
          ),
          new Expanded(
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new _DynamicCardList(),
                // 推荐
                new _CardList()
              ],
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.create, color: Colors.white),
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context){
              return new PublishPage();
            }
          ));
        }
      ),
    );
  }
}

// 动态
class _DynamicCardList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Card(
          child: new Padding(
            padding: new EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                // 头像
                new Row(
                  children: <Widget>[
                    new CircleAvatar(backgroundImage: new NetworkImage("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1937445174,2133528823&fm=27&gp=0.jpg")),
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: new Text("Chestnut")
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text("想看这部电影", style: new TextStyle(fontSize: 10.0, color: Colors.grey))
                                ),
                                new Text("昨天 20:21", style: new TextStyle(fontSize: 10.0, color: Colors.grey)),
                                new Padding(
                                  padding: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: new Icon(Icons.more_horiz, color: Colors.grey, size: 12.0)
                                )
                              ]
                            )
                          )
                        ]
                      )
                    )
                  ]
                ),
                // movie
                new Container(
                  padding: new EdgeInsets.all(8.0),
                  margin: new EdgeInsets.fromLTRB(0, 8, 0, 8),
                  decoration: new BoxDecoration(
                    color: new Color(0xffdcdcdc),
                    borderRadius: new BorderRadius.circular(4.0)
                  ),
                  child: new Stack(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          // 海报
                          new Container(
                            width: 50,
                            height: 50*1.4,
                            child: new ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: new Image.network("https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553992741.webp", fit: BoxFit.cover)
                            )
                          ),
                          // 文字介绍
                          new Expanded(
                            child: new Padding(
                              padding: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("阿拉丁 Aladdin (2019)"),
                                  new Padding(
                                    padding: new EdgeInsets.fromLTRB(0, 4, 0, 4),
                                    child: new SmoothStarRating(
                                      allowHalfRating: true,
                                      onRatingChanged: (rating){},
                                      starCount: 5,
                                      rating: 3.9,
                                      size: 10.0,
                                      color: Colors.orange,
                                      borderColor: Colors.grey,
                                      spacing: 0.0
                                    )
                                  ),
                                  new Text("2019 / 美国 / 爱情 奇幻 冒险 / 盖·里奇 / 梅娜·玛索德 娜奥米·斯科特",
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                      color: new Color(0xff8a8a8a)
                                    )
                                  )
                                ]
                              )
                            )
                          ),
                          // 已经想看
                          new Container(
                            width: 50,
                            height: 50*1.4,
                            decoration: new BoxDecoration(
                              border: new Border(left: new BorderSide(width: 1.0, color: new Color(0xffcccccc), style: BorderStyle.solid))
                            ),
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.check, color: new Color(0xff8a8a8a)),
                                new Text("已想看",
                                  style: new TextStyle(
                                    color: new Color(0xff8a8a8a),
                                    fontSize: 12.0
                                  )
                                )
                              ]
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
                // 评论
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Center(
                        child: new NumberIcon(icon: Icons.thumb_up, label: "12.4K"),
                      )
                    ),
                    new Expanded(
                      child: new Center(
                        child: new NumberIcon(icon: Icons.chat, label: "9.8K")
                      )
                    ),
                    new Expanded(
                      child: new Center(
                        child: new NumberIcon(icon: Icons.repeat, label: "401")
                      )
                    )
                  ],
                )
              ]
            )
          )
        )
      ]
    );
  }
}

// 推荐
class _CardList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new RecommendCard(),
        new RecommendCard(),
        new RecommendCard(),
        new RecommendCard(),
        new RecommendCard(),
        new RecommendCard(),
      ],
    );
  }
}
