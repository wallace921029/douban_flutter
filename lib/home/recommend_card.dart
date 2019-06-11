import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new NetworkImage("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3914950518,3569645197&fm=27&gp=0.jpg"),
                ),
                new Expanded(
                  child: new Padding(
                    padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: new Text("小了白了兔"),
                  )
                ),
                new IconButton(
                  icon: new Icon(Icons.more_horiz, color: Colors.grey,),
                  onPressed: (){},
                )
              ],
            ),
            new Row(
              children: <Widget>[
                 new Container(
                   height: 20,
                   child: new FlatButton.icon(
                      icon: new Icon(Icons.chat, size: 12.0,), 
                      label: new Text("你最欣赏什么样子的青年气质", style: new TextStyle(fontSize: 12.0)), 
                      color: new Color(0xffdcdcdc),
                      textColor: new Color(0xff00b51d),
                      padding: new EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                      onPressed: () {}
                    ),
                 )
              ],
            ),
            new Container(
              child: new Padding(
                padding: new EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: new RichText(
                  text: new TextSpan(
                    text: "2018年对我来说非常重要，发生了好几件大事，分别和写作、阅读、冒险和旅行有关。他们串起来，组成了我这2字头的最后一年。而这一年，最难以忘怀的，无疑是伊拉克和叙利亚的旅行。 本文首发...",
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black
                    ),
                  ),
                )
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}

class NumberIcon extends StatelessWidget{
  final IconData icon;
  final String label;

  NumberIcon({Key key, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    
    return new LayoutBuilder(
      builder: (context, boxConstraints){
        return new Container(
          height: 30,
          width: boxConstraints.maxWidth,
          child: new Stack(
            children: <Widget>[
              new Center(
                child: Icon(icon, color: Colors.grey, size: 18.0),
              ),
              new Positioned(
                left: boxConstraints.maxWidth/2 + 15,
                top: 5,
                child: new Text(label, style: new TextStyle(color: Colors.grey, fontSize: 10.0)),
              )
            ],
          ),
        );
      },
    );
  }

}