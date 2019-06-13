import 'package:douban_flutter/book/four_icons.dart';
import 'package:douban_flutter/book/hot_movie.dart';
import 'package:douban_flutter/book/tabview_movie_today_movie.dart';
import 'package:flutter/material.dart';

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
              new FourIcons(names: ["找电影", "豆瓣榜单", "豆瓣猜", "豆瓣片单"],),
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