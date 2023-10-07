import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vec;

class Datamanager{
  Datamanager._construct() ;
  static final _inst = Datamanager._construct();
  factory Datamanager() {
    return _inst;
  }

  final AppName = "비트 파이터 : 노트 에디터";
  Data_Color Color = new Data_Color();
  Data_String String = new Data_String();
  Util_Screen Util = new Util_Screen();
}

class Data_Color{
  var App_Background = Colors.grey[200];
  var Appbar_Background =  Colors.teal[200];
  var CommandBar_Background = Colors.green[300];

  var Note_Background = Colors.teal;
}

class Data_String{
  String AppName = "비트 파이터 : 노트 에디터";
}

class Util_Screen extends StatelessWidget {
  Util_Screen({super.key});
  ScreenSize _ScreenSize = new ScreenSize();
  ScreenSize Screen(context){
    _ScreenSize.width = MediaQuery.of(context).size.width;
    _ScreenSize.height = MediaQuery.of(context).size.height;
    return _ScreenSize;
  }
  @override
  Widget build(BuildContext context) {
    return _ScreenSize;
  }
}
class ScreenSize extends StatelessWidget
{
  double width = 0.0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}