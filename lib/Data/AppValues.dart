

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:note_beateditor/Data/Note.dart';

class AppValues {
  AppValues._const() {}
  static final AppValues _inst = AppValues._const();
  factory AppValues() {return _inst;}

  int Grid_Row = 15;
  int NoteSepreated = 1;
  int NoteLength = 50;
  NScript SelectScript = NScript.none;

  double PlaySpeed = 1.0;
  double PlaySpeed_Default = 1.0;
  double PlaySpeed_Min = 0.0;
  double PlaySpeed_Max = 2.0;

  List list_Note = List.empty(growable: true);
}

