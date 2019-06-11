import 'package:douban_flutter/market/doupin_carousel.dart';
import 'package:douban_flutter/market/doupin_product.dart';
import 'package:flutter/material.dart';

class Doupin extends StatefulWidget {
  Doupin({Key key}) : super(key: key);

  _DoupinState createState() => _DoupinState();
}

class _DoupinState extends State<Doupin> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView(
         children: <Widget>[
           // 轮播
           DoupinCarousel(),
           // 购物车、我的豆品
           Container(
             margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
             padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
             height: 40,
             color: Colors.white,
             child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                   child: Text("购物车", style: TextStyle(color: Color(0xff8a8a8a)))
                  )
                ),
                VerticalDivider(color: Colors.grey),
                Expanded(
                  child: Center(
                    child: Text("我的豆品", style: TextStyle(color: Color(0xff8a8a8a)))
                  )
                ),
              ]
             )
           ),
           // 商品展示
           Container(
             padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
             color: Colors.white,
             child: Wrap(
               children: <Widget>[
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/800_pic/c0f47446ec6042793374216838a11781.jpg",
                  title: "豆瓣手机",
                  subTitle: "感动常在",
                  price: 2888,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/addb88e9b6e9aebe3685c8c7b9b64e57.jpg",
                  title: "云米互联网电热水器",
                  subTitle: "给你保姆般的呵护",
                  price: 749,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/ec35a4e51e5ce15726bb021d26a3bba9.jpg",
                  title: "轻随MONO鞋",
                  subTitle: "软底堪比老人鞋",
                  price: 249,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/dca95fd487ce2c2c0cff186cd55ac02a.png",
                  title: "法乐全自动波轮洗衣机 10KG",
                  subTitle: "妈妈每天都给你洗衣服",
                  price: 1099,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/800_pic/c0f47446ec6042793374216838a11781.jpg",
                  title: "豆瓣手机",
                  subTitle: "感动常在",
                  price: 2888,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/addb88e9b6e9aebe3685c8c7b9b64e57.jpg",
                  title: "云米互联网电热水器",
                  subTitle: "给你保姆般的呵护",
                  price: 749,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/ec35a4e51e5ce15726bb021d26a3bba9.jpg",
                  title: "轻随MONO鞋",
                  subTitle: "软底堪比老人鞋",
                  price: 249,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/dca95fd487ce2c2c0cff186cd55ac02a.png",
                  title: "法乐全自动波轮洗衣机 10KG",
                  subTitle: "妈妈每天都给你洗衣服",
                  price: 1099,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/800_pic/c0f47446ec6042793374216838a11781.jpg",
                  title: "豆瓣手机",
                  subTitle: "感动常在",
                  price: 2888,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/addb88e9b6e9aebe3685c8c7b9b64e57.jpg",
                  title: "云米互联网电热水器",
                  subTitle: "给你保姆般的呵护",
                  price: 749,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/ec35a4e51e5ce15726bb021d26a3bba9.jpg",
                  title: "轻随MONO鞋",
                  subTitle: "软底堪比老人鞋",
                  price: 249,
                ),
                DoupinProduct(
                  src: "https://img.youpin.mi-img.com/goods/dca95fd487ce2c2c0cff186cd55ac02a.png",
                  title: "法乐全自动波轮洗衣机 10KG",
                  subTitle: "妈妈每天都给你洗衣服",
                  price: 1099,
                )
               ]
             )
           )
         ]
       )
    );
  }
}