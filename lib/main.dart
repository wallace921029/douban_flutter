import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'douban_container.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DoubanContainer();
  }
}
