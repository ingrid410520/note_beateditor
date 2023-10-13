import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Build_AppBar.dart';
import 'package:note_beateditor/Build_BODY.dart';
import 'package:note_beateditor/Data/Datamanager.dart';
import 'package:note_beateditor/Function/Function_OpneNote.dart';
import 'package:note_beateditor/Data/AppValues.dart';

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
  AppValues appValues = AppValues();

  update() {
    setState(() {
      print("Update");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: build_Header(context),
      appBar: Build_AppBar(appValues: appValues, update: update),
      body: Build_BODY(appValues: appValues, context: context),
      bottomNavigationBar: build_Bottom(context),
    );
  }

  BottomAppBar build_Bottom(BuildContext context) {
    return BottomAppBar(
        color: Datamanager().Color.Appbar_Background,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Note Count : " + appValues.NoteLength.toString()),
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
                    child: Text("reset"),
                    onPressed: () {
                      setState(() {
                        appValues.PlaySpeed = appValues.PlaySpeed_Default;
                      });
                    },
                  ),
                  Slider.adaptive(
                    value: appValues.PlaySpeed,
                    min: appValues.PlaySpeed_Min,
                    max: appValues.PlaySpeed_Max,
                    divisions: 4,
                    label: appValues.PlaySpeed.toString(),
                    onChanged: (value) {
                      setState(() {
                        appValues.PlaySpeed = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
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
