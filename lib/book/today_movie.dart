import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodayMovie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      margin: new EdgeInsets.all(8.0),
      child: new Stack(
        children: <Widget>[
          // 背景
          new Positioned(
            bottom: 0,
            child: new Container(
              width: MediaQuery.of(context).size.width-16,
              height: 100,
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: new BorderRadius.all(new Radius.circular(8.0))
              )
            )
          ),
          // 电影和文字
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Stack(
                  children: <Widget>[
                    // movie1
                    new Positioned(
                      left: 80.0,
                      bottom: 16.0,
                      child: new Container(
                        width: 80/1.4,
                        height: 80,
                        child: new Image.network("https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554370800.webp", fit: BoxFit.cover)
                      ),
                    ),
                    // movie2
                    new Positioned(
                      left: 48.0,
                      bottom: 16.0,
                      child: new Container(
                        width: 90/1.4,
                        height: 90,
                        child: new Image.network("https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553992741.webp", fit: BoxFit.cover)
                      ),
                    ),
                    // movie3
                    new Positioned(
                      left: 16.0,
                      bottom: 16.0,
                      child: new Container(
                        width: 100/1.4,
                        height: 100,
                        child: new Image.network("https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554324453.webp", fit: BoxFit.cover)
                      ),
                    )
                  ]
                )
              ),
              new Expanded(
                child: new Stack(
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("今日可播放电影已更新", style: new TextStyle(color: Colors.white)),
                        new Text("全部 30 >", style: new TextStyle(color: Colors.white, fontSize: 12.0))
                      ]
                    ),
                    new Positioned(
                      right: 8,
                      bottom: 8,
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.movie, size: 10, color: Colors.white),
                          new Text(" 看电影", style: new TextStyle(fontSize: 10.0, color: Colors.white))
                        ]
                      )
                    )
                  ],
                )
              )
            ]
          )
        ]
      )
    );
  }
}