import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchInput extends StatefulWidget{
  final Color fillColor;

  SearchInput({Key key, this.fillColor});

  @override
  State<StatefulWidget> createState() {
    return new _SearchInputState();
  }
}

class _SearchInputState extends State<SearchInput>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 30,
      child: new TextField(
        cursorColor: new Color(0xff8a8a8a),
        decoration: new InputDecoration(
          hintText: "我有独特的吵架技巧",
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: new BorderRadius.all(new Radius.circular(100.0))
          ),
          contentPadding: EdgeInsets.all(0.0),
          filled: true,
          fillColor: widget.fillColor,
          prefixIcon: new Icon(Icons.search, color: Colors.grey),
          suffixIcon: new GestureDetector(
            child: new Icon(Icons.center_focus_strong, color: Colors.grey),
            onTap: (){}
          )
        ),
      ),
    );
  }
}