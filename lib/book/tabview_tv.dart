import 'package:douban_flutter/book/four_icons.dart';
import 'package:douban_flutter/book/tv_rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TvTabView extends StatefulWidget {
  TvTabView({Key key}) : super(key: key);

  _TvTabViewState createState() => _TvTabViewState();
}

class _TvTabViewState extends State<TvTabView> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List<Widget> _tabs = List<Widget>();
  Map<int, List<TvRate>> _tvTypeContent = Map();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabs.addAll([Text("综合"), Text("国产剧"), Text("英美剧"), Text("日剧"), Text("韩剧"), Text("动画")]);
    _tabController = TabController(length: _tabs.length, vsync: this);

    _tvTypeContent[0] = [
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556232270.jpg", name: "破冰行动", rate: 7.1),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553707144.jpg", name: "轮到你了", rate: 8.5),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555598611.jpg", name: "有色眼镜", rate: 8.8),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557959835.jpg", name: "历史人物吐槽会 第一季", rate: 7.2),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2554965058.jpg", name: "欺诈担保人 第三季", rate: 7.7),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558381556.jpg", name: "黑镜 第五季", rate: 6.6)
    ];
    _tvTypeContent[1] = [
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556232270.jpg", name: "破冰行动", rate: 7.1),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2522426850.jpg", name: "动物管理局", rate: 7.5),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2550074150.jpg", name: "暗恋橘生淮南", rate: 7.2),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2558527708.jpg", name: "盗墓笔记之怒海潜沙&淮岭神树", rate: 5.2),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557132955.jpg", name: "我的真朋友", rate: 4.6),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2517603547.jpg", name: "我只喜欢你", rate: 7.5)
    ];
    _tvTypeContent[2] = [
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558381556.jpg", name: "黑镜 第五季", rate: 6.6),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553373343.jpg", name: "学疫", rate: 7.1),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555598611.jpg", name: "有色眼镜", rate: 8.1),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2554965058.jpg", name: "欺诈担保人 第三季", rate: 7.7),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2556147158.jpg", name: "大小谎言 第二季", rate: 9.3),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2559470557.jpg", name: "使女的故事 第三季", rate: 9.3)
    ];
    _tvTypeContent[3] = [
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553707144.jpg", name: "轮到你了", rate: 8.5),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2548374060.jpg", name: "坡道上的家", rate: 9.1),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2556442589.jpg", name: "别扭合租房", rate: 7.4),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553865222.jpg", name: "我，到点下班", rate: 8.3),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2510604929.jpg", name: "非自然死亡", rate: 9.4),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553223074.jpg", name: "昨日的美食", rate: 8.7)
    ];
    _tvTypeContent[4] = [
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554598542.jpg", name: "春夜", rate: 8.8),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556419121.jpg", name: "请输入搜索词：WWW", rate: 9.1),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554433961.jpg", name: "绿豆花", rate: 8.7),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2549329796.jpg", name: "囚犯医生", rate: 9.0),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2272563445.jpg", name: "请回答 1998", rate: 9.7),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555648768.jpg", name: "仅此一次的爱情", rate: 8.4)
    ];
    _tvTypeContent[5] = [
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2550184312.jpg", name: "进击的巨人 第三季 Part.2", rate: 9.8),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2545649085.jpg", name: "卡罗尔与星期二", rate: 9.3),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2544476692.jpg", name: "裤袜视界", rate: 7.1),
      TvRate(src: "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2549894230.jpg", name: "一拳超人 第二季", rate: 7.7),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551222097.jpg", name: "鬼灭之刃", rate: 8.6),
      TvRate(src: "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2535645337.jpg", name: "强风吹拂", rate: 9.6)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView(
         children: <Widget>[
           FourIcons(names: ["找电视", "豆瓣榜单", "豆瓣猜", "播出时间表"]),
           // 热播电视剧
           Padding(
             padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("热播新剧", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("全部 273 >", style: TextStyle(fontSize: 12.0))
              ]
            )
           ),
           // 热播电视剧 TabBar
           Container(
             margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
             decoration: BoxDecoration(
               border: Border(bottom: BorderSide(color: Color(0xffdcdcdc)))
             ),
             child: TabBar(
               tabs: _tabs,
               controller: _tabController,
               isScrollable: true,
               indicatorColor: Colors.black,
               indicatorSize: TabBarIndicatorSize.tab,
               indicatorPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
               labelColor: Colors.black,
               labelStyle: TextStyle(fontSize: 14.0),
               labelPadding: EdgeInsets.fromLTRB(0, 5, 20, 5),
               onTap: (int index) {
                 setState(() {
                   _currentIndex = index;
                 });
               },
             ),
           ),
           // 热播电视剧分类展示
           Container(
             padding: EdgeInsets.fromLTRB(3, 10, 3, 10),
             child: Wrap(
               children: _tvTypeContent[_currentIndex]
             )
           )
         ]
       )
    );
  }
}