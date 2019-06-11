import 'package:douban_flutter/market/douban_time.dart';
import 'package:douban_flutter/market/doupin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Market extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MarketState();
  }
}

// TabBar 和 TabBarView 控制部分
class _MarketState extends State<Market> with TickerProviderStateMixin{
  // TabBar 数组和对应的控制器
  TabController _tabController;
  List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [Text("豆瓣豆品"), Text("豆瓣时间")];
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          width: MediaQuery.of(context).size.width/2,
          height: 40,
          child: TabBar(
            controller: _tabController,
            tabs: _tabs,
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
          )
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Doupin(),
          DoubanTime()
        ]
      )
    );
  }
}