import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({super.key, required int Sec, required int Sep})
      : _Sep = Sep,
        _Sec = Sec;

  final int _Sec;
  final int _Sep;

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
        setState(() {

        });
      },
    );
  }
}
