import 'package:flutter/material.dart';
import 'package:note_beateditor/Data/AppValues.dart';

import 'Data/Datamanager.dart';

class Build_Bottom extends StatefulWidget {
  const Build_Bottom({super.key, required this.appValues, required this.update});

  final AppValues appValues;

  final Function update;

  @override
  State<Build_Bottom> createState() => _Build_BottomState();
}

class _Build_BottomState extends State<Build_Bottom> {
  List<String> menu = ['Exam1', 'Exam2', 'Exam3'];
  String select = 'Exam1';

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Datamanager().Color.Appbar_Background,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              build_UI_Script(context),
              build_UI_Noteplay(context),
              build_UI_PlaySpeed(context),
            ],
          ),
        ));
  }

  Widget build_UI_PlaySpeed(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: Datamanager().Util.Screen(context).width * 0.25,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "PlaySpeed",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("reset"),
              onPressed: () {
                setState(() {
                  widget.appValues.PlaySpeed = widget.appValues.PlaySpeed_Default;
                });
              },
            ),
            Container(
              //color: Colors.greenAccent,
              width: Datamanager().Util.Screen(context).width * 0.15,
              child: Slider.adaptive(
                value: widget.appValues.PlaySpeed,
                min: widget.appValues.PlaySpeed_Min,
                max: widget.appValues.PlaySpeed_Max,
                divisions: 8,
                label: widget.appValues.PlaySpeed.toString(),
                onChanged: (value) {
                  setState(() {
                    widget.appValues.PlaySpeed = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_UI_Script(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: Datamanager().Util.Screen(context).width * 0.25,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "Script",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildDropMenu_ScriptType(),
            ElevatedButton(
              child: Text("Add Script"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropMenu_ScriptType() {
    return DropdownButton(
      value: select,
      items: menu.map((item) {
        return DropdownMenuItem(value: item, child: Text("$item"));
      }).toList(),
      onChanged: (value) {
        setState(() {
          select = value as String;
        });
      },
    );
  }

  Widget build_UI_Noteplay(BuildContext context) {
    return Container(
      width: Datamanager().Util.Screen(context).width * 0.45,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "Play",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.keyboard_double_arrow_left),
              label: Text("Back"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.play_arrow),
              label: Text("Play/Pause"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.keyboard_double_arrow_right),
              label: Text("Forward"),
            ),
          ],
        ),
      ),
    );
  }
}
