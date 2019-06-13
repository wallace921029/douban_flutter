import 'package:douban_flutter/douban_color/douban_color.dart';
import 'package:douban_flutter/group/divider_with_text.dart';
import 'package:douban_flutter/group/group_item.dart';
import 'package:douban_flutter/home/search_input.dart';
import 'package:flutter/material.dart';

class Group extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GroupState();
  }
}

class _GroupState extends State<Group>{
  List<GroupItem> list1;
  List<String> listResult = new List<String>();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    list1 = List<GroupItem>();
    list1.addAll(
      [
        GroupItem(
          src: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=238385114,3982102561&fm=27&gp=0.jpg",
          title: "公共场所道德の卫士",
          subtitle: "你是否有间歇性道德洁癖，异常注重和遵守公共场合规则或规章，甚至经常为此不能夜寐？你是否时不时...",
          people: 6058,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3107697854,3428670354&fm=27&gp=0.jpg",
          title: "我最受不了的那些事儿",
          subtitle: "生活压力那么大，找个地方吐槽吧。",
          people: 10490,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2768370066,2433768899&fm=15&gp=0.jpg",
          title: "佛跳墙城市探索小组",
          subtitle: "欢迎交流，交换城市废墟信息。",
          people: 25183,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://img3.doubanio.com/icon/g10233-3.jpg",
          title: "买书如山倒 读书如抽丝",
          subtitle: "买书时总有一种囤积的热情。阅读时却总没时间、没心情、没机会、没耐心。",
          people: 11168,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://img1.doubanio.com/view/group/sqxs/public/b7f8c52b0488a3c.webp",
          title: "一起拼途去旅行",
          subtitle: "为嘛要一起拼途？⑴请到假旅行 ⑵盆友没人有空，一个人。尼玛，以前是想独自旅行，现在只能一个人旅行 ",
          people: 11168,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://img3.doubanio.com/icon/g301633-2.jpg",
          title: "DOTA2",
          subtitle: "小组新建两个qq群,欢迎大家加群一起交流",
          people: 11168,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://img3.doubanio.com/icon/g17772-1.jpg",
          title: "成都饮食乌托邦",
          subtitle: "我们来自五湖四海，以吃喝的名义聚集在一起，不分贵贱、无所谓派系，挑剔的味觉是我们惟一信赖的武器，敏锐的嗅觉是我们值得骄傲的资本",
          people: 11168,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://img3.doubanio.com/view/group/sqxs/public/8eccc9de95d7cc6.webp",
          title: "喜欢跑步的人",
          subtitle: "在古希腊奥林匹亚阿尔菲斯河岸的岩壁上保留着这样一段格言：",
          people: 11168,
          isChecked: false,
          callback: _groupItemCallback
        ),
        GroupItem(
          src: "https://img3.doubanio.com/view/group/sqxs/public/848ae1a0c2064f6.webp",
          title: "自己做饭自己吃",
          subtitle: "我们不爱吃快餐，我们一个人住，我们做的饭只有自己吃。这样的心情，只有你知、我知。",
          people: 11168,
          isChecked: false,
          callback: _groupItemCallback
        )
      ]
    );
  }

  _groupItemCallback(bool value, String name) {
    if (value) {
      setState(() {
        listResult.add(name);
      });
    } else {
      listResult.remove(name);
    }
    
    if (listResult.length == 0) {
      setState(() {
        _isButtonDisabled = true;
      });
    } else {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }

  _playGroup() {
    List<SimpleDialogOption> list = new List<SimpleDialogOption>();
    listResult.forEach((name) {
      list.add(
        SimpleDialogOption(
          child: Text(name),
          onPressed: () {}
        )
      );
    });
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('以下是你选中的小组'),
          children: list
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchInput(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mail, color: Colors.grey),
            onPressed: () {}
          )
        ]
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: ListView(
              children: <Widget>[
                DividerWithText(text: "热门小组"),
                Wrap(children: list1.sublist(0, 3)),
                DividerWithText(text: "我吃瓜雨女无瓜"),
                Wrap(children: list1.sublist(3, 6)),
                DividerWithText(text: "吃吃吃"),
                Wrap(children: list1.sublist(6)),
              ]
            )
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.6),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff8a8a8a),
                    blurRadius: 3,
                    offset: Offset(0, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    offset: Offset(0, 0)
                  )
                ]
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                children: <Widget>[
                  Icon(Icons.autorenew, color: DoubanColors.doubanGreen),
                  Expanded(
                    child: Text("换一批", style: TextStyle(color: DoubanColors.doubanGreen))
                  ),
                  FlatButton(
                    color: DoubanColors.doubanGreen,
                    child: Text("选好了，去玩小组"),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    onPressed: _isButtonDisabled ? null : _playGroup,
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}