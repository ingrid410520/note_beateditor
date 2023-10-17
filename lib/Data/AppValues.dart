

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_beateditor/Note/Enum_Script.dart';
import 'package:note_beateditor/Note/Note.dart';

class AppValues {
  AppValues._const() {}
  static final AppValues _inst = AppValues._const();
  factory AppValues() {return _inst;}

  // Appbar UI
  int UI_Grid_Row = 15;
  int UI_NoteSepreated = 1;
  int NoteLength = 50;

  // Bottom UI
  ScriptInfo scriptInfo = ScriptInfo();
  NScript ui_SelectedScript = NScript.none;
  var ui_SelectedScriptOption = "NoData";

  double PlaySpeed = 1.0;
  double PlaySpeed_Default = 1.0;
  double PlaySpeed_Min = 0.0;
  double PlaySpeed_Max = 2.0;

  // Note Info
  List list_Note = List.empty(growable: true);
}

