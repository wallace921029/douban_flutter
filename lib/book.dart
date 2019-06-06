import 'package:douban_flutter/four_icons.dart';
import 'package:douban_flutter/movie_rate.dart';
import 'package:douban_flutter/search_input.dart';
import 'package:douban_flutter/today_movie.dart';
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
        title: new SearchInput(fillColor: new Color(0xffd5d5d5)),
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
          new Expanded(
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new MovieTabView(),
                new Text("电视"),
                new Text("综艺"),
                new Text("读书"),
                new Text("音乐"),
                new Text("同城")
              ],
            )
          )
        ]
      )
    );
  }
}

class MovieTabView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _MovieTabViewState();
  }

}

class _MovieTabViewState extends State<MovieTabView>{
  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
      builder: (context, boxConstraints) {
        return new Container(
          height: boxConstraints.maxHeight,
          child: new ListView(
            children: <Widget>[
              // 4个icon按钮
              new FourIcons(),
              // 今日可播放电影已更新
              new TodayMovie(),
              // 影院热映、即将上映
              new HotMovie(),
            ]
          )
        );
      },
    );
  }
}

class HotMovie extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HotMovieState();
  }

}

class _HotMovieState extends State<HotMovie> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List<Widget> _tabs = new List<Widget>();
  List<Widget> _movieList = [new CinemaHot(), new NewMovies()];
  int _currentIndex = 0;
  int _movieCount = 30;

  @override
  void initState() {
    super.initState();
    _tabs.addAll([
      new Text("影院热映"),
      new Text("即将上映")
    ]);
    _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        // TabBar
        new Container(
          height: 40,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                left: 0,
                child: new Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width/2,
                  child: new TabBar(
                    controller: _tabController,
                    tabs: _tabs,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;

                        if (index == 0) {
                          _movieCount = 31;
                        }

                        if (index == 1) {
                          _movieCount = 91; 
                        }
                      });
                    }
                  )
                )
              ),
              new Positioned(
                right: 8,
                child: new Container(
                  height: 40,
                  child: new Center(
                    child: new Text("全部 $_movieCount >", style: new TextStyle(fontSize: 12.0))
                  )
                )
              )
            ]
          )
        ),
        // TabBarView
        _movieList[_currentIndex]
      ]
    );
  }
}

class CinemaHot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: new Wrap(
        children: <Widget>[
          new MovieRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554370800.webp", name: "哥斯拉2：怪兽之王", rate: 6.4),
          new MovieRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553992741.webp", name: "阿拉丁", rate: 7.8),
          new MovieRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557500825.webp", name: "哆啦A梦：大雄的月球探险记", rate: 7.5),
          new MovieRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555538168.webp", name: "大侦探皮卡丘", rate: 6.7),
          new MovieRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557589889.webp", name: "无所不能", rate: 7.2),
          new MovieRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555859678.webp", name: "一条狗的使命2", rate: 6.8)
        ]
      )
    );
  }
}

class NewMovies extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: new Wrap(
        children: <Widget>[
          new MovieComeSoon(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp",name: "X战警：黑凤凰", people: 89939, date: "06月06日"),
          new MovieComeSoon(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558294190.webp",name: "追龙Ⅱ", people: 18768, date: "06月06日"),
          new MovieComeSoon(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557157554.webp",name: "最好的我们", people: 5945, date: "06月06日"),
          new MovieComeSoon(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557956447.webp",name: "当我们海阔天空", people: 3314, date: "06月06日"),
          new MovieComeSoon(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558276323.webp",name: "呆瓜兄弟", people: 252, date: "06月07日"),
          new MovieComeSoon(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557188439.webp",name: "街舞青春", people: 72, date: "06月07日")
        ]
      )
    );
  }
}