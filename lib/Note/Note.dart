import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_beateditor/Data/AppValues.dart';

import '../Data/Datamanager.dart';
import 'Enum_Script.dart';

enum NSubScript {
  None,
}

class Note extends StatefulWidget {
  Note({super.key, required int Sec, required int Sep})
      : _Sep = Sep,
        _Sec = Sec;

  final int _Sec;
  final int _Sep;
  bool isPlayed = false;
  bool hasScript = false;

  NoteScript Script = NoteScript(eScriptType: NScript.none, option: "empty");

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    int Sec = widget._Sec;
    int Sep = widget._Sep;

    return OutlinedButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AutoSizeText(
            "$Sec - $Sep",
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
          ),
          Text("${AppValues().scriptInfo.getScriptTypeString(widget.Script.eScriptType)}")
        ],
      ),
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(0),
          alignment: Alignment.topCenter,
          //textStyle: TextStyle(fontSize: 20),
          backgroundColor: Datamanager().Color.Note_Background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      onPressed: () {
        setState(() {
          var vScriptType = AppValues().ui_SelectedScript;
          var vOption = AppValues().ui_SelectedScriptOption;
          widget.Script!.setScript(vScriptType, vOption);
        });
      },
    );
  }
}

class NoteScript {
  NoteScript({required this.eScriptType, required this.option});

  NScript eScriptType = NScript.none;
  var option = "Nodata";

  void setScript(NScript vScriptType, var vOption) {
    eScriptType = vScriptType;
    option = vOption;
  }
}
