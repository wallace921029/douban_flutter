import 'package:flutter/material.dart';

class DoupinProduct extends StatelessWidget {
  final String src;
  final String title;
  final String subTitle;
  final num price;

  const DoupinProduct({Key key, this.title, this.src, this.subTitle, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width/2 - 20,
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1/1,
              child: Image.network(src, fit: BoxFit.cover)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              child: Text("$title", style: TextStyle(fontSize: 14.0), overflow: TextOverflow.ellipsis)
            ),
            Text("$subTitle", style: TextStyle(color: Colors.grey, fontSize: 12.0), overflow: TextOverflow.ellipsis),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
              child: Text("¥ ${price.toString()}", style: TextStyle(fontSize: 16.0, color: Colors.red), overflow: TextOverflow.ellipsis)
            )
          ]
        )
      )
    );
  }
}