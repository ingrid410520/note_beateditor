import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_beateditor/Data/AppValues.dart';

import 'Datamanager.dart';

enum NScript {
  none,
  custom,
  singleStep_Execu,
  multiStep_Execu,
  hitCheck,
  sound_Bgm,
  sound_Effect,
  sound_Action,
  objectControl,
}

class Note extends StatefulWidget {
  Note({super.key, required int Sec, required int Sep, this.listScript})
      : _Sep = Sep,
        _Sec = Sec;

  final int _Sec;
  final int _Sep;
  bool isPlayed = false;
  bool hasScript = false;

  List<NoteScript>? listScript = List.empty(growable: true);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  int test = 1;

  @override
  Widget build(BuildContext context) {
    int Sec = widget._Sec;
    int Sep = widget._Sep;

    return OutlinedButton(
      child: AutoSizeText("$Sec - $Sep : $test", maxLines: 2),
      style: OutlinedButton.styleFrom(
          alignment: Alignment.topCenter,
          backgroundColor: Datamanager().Color.Note_Background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      onPressed: () {
        setState(() {
          test+=1;
        });
      },
    );
  }
}

class NoteScript {
  NoteScript({required this.eScriptType, required this.detail});

  NScript eScriptType = NScript.none;
  var detail = "None";
}
