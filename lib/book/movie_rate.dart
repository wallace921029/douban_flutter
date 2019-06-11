import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 

class MovieRate extends StatelessWidget{
  final String src;
  final String name;
  final double rate;

  MovieRate({this.src, this.name, this.rate});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width/3,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图片
          new LayoutBuilder(
            builder: (context, boxConstraints) {
              return new Container(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth*1.4,
                child: new Image.network(src, fit: BoxFit.cover)
              );
            },
          ),
          // 文字
          new Text(
            name, 
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold
            ),
          ),
          // 评分
          new Row(
            children: <Widget>[
              new SmoothStarRating(
                allowHalfRating: true,
                onRatingChanged: (rating){},
                starCount: 5,
                rating: rate/2,
                size: 10.0,
                color: Colors.orange,
                borderColor: Colors.grey,
                spacing: 0.0
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: new Text(
                  "$rate",
                  style: new TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}

class MovieComeSoon extends StatelessWidget{
  final String src;
  final String name;
  final int people;
  final String date;

  MovieComeSoon({this.src, this.name, this.people, this.date});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width/3,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图片
          new LayoutBuilder(
            builder: (context, boxConstraints) {
              return new Container(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth*1.4,
                child: new Image.network(src, fit: BoxFit.cover)
              );
            },
          ),
          // 文字
          new Text(
            name, 
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold
            )
          ),
          // 多少人想看
          new Text("${people}人想看",
            style: new TextStyle(
              fontSize: 10.0,
              color: new Color(0xff8a8a8a)
            )
          ),
          // 上映日期
          new Container(
            padding: new EdgeInsets.fromLTRB(4, 0, 4, 0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(4.0),
              border: new Border.all(color: Colors.red, width: 1.0, style: BorderStyle.solid)
            ),
            child: new Text("$date",
              style: new TextStyle(
                fontSize: 10.0,
                color: Colors.red
              )
            )
          )
        ]
      )
    );
  }
}