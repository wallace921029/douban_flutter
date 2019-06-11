import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DoupinCarousel extends StatelessWidget {
  const DoupinCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 200.0,
      aspectRatio: 16/9,
      viewportFraction: 1.0,
      items: [
        Image.network(
          "http://p0.meituan.net/codeman/daa73310c9e57454dc97f0146640fd9f69772.jpg", 
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width
        ),
        Image.network(
          "http://p1.meituan.net/codeman/826a5ed09dab49af658c34624d75491861404.jpg", 
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width
        ),
        Image.network(
          "http://p0.meituan.net/codeman/a97baf515235f4c5a2b1323a741e577185048.jpg", 
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width
        ),
        Image.network(
          "http://p0.meituan.net/codeman/33ff80dc00f832d697f3e20fc030799560495.jpg", 
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width
        )
      ]
    );
  }
}