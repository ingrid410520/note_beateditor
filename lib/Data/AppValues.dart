

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:note_beateditor/Data/Note.dart';

class AppValues extends StatefulWidget {
  AppValues({super.key});

  int Grid_Row = 15;
  int NoteSepreated = 1;
  int NoteLength = 50;
  NScript SelectScript = NScript.none;

  double PlaySpeed = 1.0;
  double PlaySpeed_Default = 1.0;
  double PlaySpeed_Min = 0.0;
  double PlaySpeed_Max = 2.0;

  List<String> list_Note = List.empty(growable: true);
  // @override
  // initState(){
  //   textedit_GridRow = TextEditingController(text: "15");
  //   textedit_NoteSeperated = TextEditingController(text: "1");
  //   textedit_NoteLength = TextEditingController(text: "50");
  //   list_Note = List.empty(growable: true);
  // }

  @override
  State<AppValues> createState() => _AppValuesState();
}

class _AppValuesState extends State<AppValues> {


  @override
  void initState(){

    //extedit_GridRow = TextEditingController(text: "15");
    //textedit_NoteSeperated = TextEditingController(text: "1");
    //textedit_NoteLength = TextEditingController(text: "50");
    //list_Note = List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
