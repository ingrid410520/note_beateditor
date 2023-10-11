import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Data/Datamanager.dart';
import 'package:note_beateditor/Function/Function_OpneNote.dart';

import 'package:note_beateditor/Build_Header.dart';
import 'package:note_beateditor/Build_BODY.dart';

class AppValues{
  TextEditingController GridRow = TextEditingController(text: "15");
  TextEditingController NoteSeperated = TextEditingController(text: "1");
  TextEditingController NoteLength = TextEditingController(text: "50");

  List<String> listNote = List.empty(growable: true);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Datamanager().AppName,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  AppValues appValues = new AppValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Build_Header(context),
      appBar: Build_HEADER(appValues: appValues),
      body: Build_BODY(appValues: appValues),
      bottomNavigationBar: BottomAppBar(
          color: Datamanager().Color.Appbar_Background,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text("Add Script"),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Text("Select Script"),
                      onPressed: () {},
                    ),
                  ],
                ),
                build_UI_Noteplay(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text("Temp1"),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      child: Text("Temp2"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Container build_UI_Noteplay(BuildContext context) {
    return Container(
      width: Datamanager().Util.Screen(context).width * 0.5,
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
    );
  }
}
