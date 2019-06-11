import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(color: Colors.grey)
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text("$text", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))
          ),
          Expanded(
            child: Divider(color: Colors.grey)
          )
        ]
      )
    );
  }
}