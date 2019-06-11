import 'package:flutter/material.dart';

class GroupItem extends StatefulWidget {
  GroupItem({Key key, this.src, this.title, this.subtitle, this.people, this.isChecked, this.callback}) : super(key: key);

  final String src;
  final String title;
  final String subtitle;
  final num people;
  bool isChecked;
  Function(bool, String) callback;

  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: ListTile(
        leading: Image.network(widget.src),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          )
        ),
        subtitle: Text(
          widget.subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.0
          )
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    "${widget.people.toString()}人",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  )
                )
              ),
              Checkbox(
                value: widget.isChecked,
                onChanged: (bool value) {
                  setState(() {
                    widget.isChecked = value;
                  });
                  widget.callback(value, widget.title);
                },
              )
            ]
          )  
        )
      ),
    );
  }
}