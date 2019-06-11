import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchInput extends StatefulWidget{
  SearchInput({Key key, this.fillColor});

  Color fillColor = Color(0xffdcdcdc);

  @override
  State<StatefulWidget> createState() {
    return new _SearchInputState();
  }
}

class _SearchInputState extends State<SearchInput>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TextField(
        decoration: InputDecoration(
          hintText: "我有独特的吵架技巧",
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.filter_center_focus, color: Colors.grey),
          filled: true,
          fillColor: widget.fillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40.0)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40.0)
          )
        ),
        cursorColor: Color(0xff8a8a8a)
      )
    );
  }
}