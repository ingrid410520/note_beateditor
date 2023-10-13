import 'package:flutter/material.dart';

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
  List<NoteScript>? listScript = List.empty(growable: true);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    int Sec = widget._Sec;
    int Sep = widget._Sep;

    return OutlinedButton(

      child: Text("$Sec - $Sep"),
      onPressed: () {
        setState(() {});
      },
    );
  }
}

class NoteScript {
  NoteScript({required this.eScriptType, required this.detail});
  NScript eScriptType = NScript.none;
  var detail = "None";
}
