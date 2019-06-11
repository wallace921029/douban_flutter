import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();
class SendImageEvent{
  String src;
  SendImageEvent(this.src);
}

class PublishPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _PublishPage();
  }
}

class _PublishPage extends State<PublishPage>{
  
  List<Widget> _imageLists = new List<Widget>();

  @override
  void initState() {
    super.initState();
    _imageLists.add(new _AddImageButton());
    _listen();
  }

  void _listen() {
    eventBus.on<SendImageEvent>().listen((onData){
      print("监听到 SendImageEvent 事件");
      print("mounted 状态：$mounted");
      // 需要监听 mounted 状态，否则会报错
      if(mounted) {
        setState(() {
          _imageLists.insert(_imageLists.length-1, new _ImagePicture(onData.src));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.close),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.publish),
            color: new Color(0xff00b51d),
            tooltip: "发布",
            disabledColor: Colors.grey,
            onPressed: () {}
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          // 文字
          new Expanded(
            child: new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new TextField(
                maxLines: 20,
                style: new TextStyle(
                  fontSize: 14.0
                ),
                decoration: new InputDecoration(
                  hintText: "瞬间的思绪也值得被留下...",
                  hintStyle: new TextStyle(
                    fontSize: 14.0
                  ),
                  enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(style: BorderStyle.none)),
                  border: new UnderlineInputBorder(borderSide: new BorderSide(style: BorderStyle.none)),
                  focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(style: BorderStyle.none)),
                ),
              ),
            )
          ),
          // 图片
          new Container(
            width: MediaQuery.of(context).size.width,
            child: new Wrap(
              children: _imageLists,
            )
          ),
          // 隐私选项
          new Builder(
            builder: (context) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(8, 0, 8, 20),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new GestureDetector(
                      child: new Container(
                        child: new Text('公开'),
                      ),
                      onTap: () {
                        showModalBottomSheet(context: context, builder: (BuildContext context) {
                          return new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Container(
                                height: 60,
                                child: new Center(child: new Text("公开", style: new TextStyle(color: Colors.lightBlue))),
                              ),
                              new Divider(height: 0.0),
                              new Container(
                                height: 60,
                                child: new Center(child: new Text("仅我关注的人可回复", style: new TextStyle(color: Colors.lightBlue))),
                              ),
                              new Divider(height: 0.0),
                              new Container(
                                height: 60,
                                child: new Center(child: new Text("私密", style: new TextStyle(color: Colors.lightBlue))),
                              ),
                              new Divider(height: 0.0),
                              new Container(
                                height: 60,
                                child: new Center(child: new Text("取消", style: new TextStyle(color: Colors.red))),
                              )
                            ],
                          );
                        });
                      },
                    )
                  ],
                ),
              );
            },
          )
        ],
      )
    );
  }
}

class _AddImageButton extends StatelessWidget{
  final String src = "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2229346952,2661940409&fm=27&gp=0.jpg";
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        eventBus.fire(new SendImageEvent(src));
      },
      child: new Container(
        width: MediaQuery.of(context).size.width / 4 - 8,
        height: MediaQuery.of(context).size.width / 4 - 8,
        margin: new EdgeInsets.all(4.0),
        decoration: new BoxDecoration(
          color: new Color(0xffd5d5d5),
          borderRadius: new BorderRadius.all(new Radius.circular(4.0))
        ),
        child: new Center(
          child: new Icon(Icons.add)
        )
      )
    );
  }
}

class _ImagePicture extends StatelessWidget{
  final String src;
  _ImagePicture(this.src);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width/4,
      height: MediaQuery.of(context).size.width/4,
      child: new Padding(
        padding: new EdgeInsets.all(4.0),
        child: new Image.network(src)
      )
    );
  }
}