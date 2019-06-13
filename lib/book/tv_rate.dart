import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TvRate extends StatefulWidget {
  TvRate({
    Key key, 
    this.src = "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556232270.jpg", 
    this.name = "破冰行动", 
    this.rate = 7.1
  }) : super(key: key);

  String src;
  String name;
  num rate;

  _TvRateState createState() => _TvRateState();
}

class _TvRateState extends State<TvRate> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: LayoutBuilder(
         builder: (BuildContext buildContext, BoxConstraints boxConstraints) {
           var width = boxConstraints.maxWidth/3;
           return Container(
             width: width,
             padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Image.network(
                    widget.src, 
                    fit: BoxFit.cover,
                    width: width - 10,
                    height: (width - 10) * 1.4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                    child: Text(
                      widget.name, 
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Row(
                    children: <Widget>[
                      new SmoothStarRating(
                        allowHalfRating: true,
                        onRatingChanged: (rating){},
                        starCount: 5,
                        rating: widget.rate/2,
                        size: 10.0,
                        color: Colors.orange,
                        borderColor: Colors.grey,
                        spacing: 0.0
                      ),
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: new Text(
                          widget.rate.toString(),
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
       )
    );
  }
}