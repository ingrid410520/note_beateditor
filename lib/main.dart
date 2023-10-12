import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Build_AppBar.dart';
import 'package:note_beateditor/Build_BODY.dart';
import 'package:note_beateditor/Data/Datamanager.dart';
import 'package:note_beateditor/Function/Function_OpneNote.dart';
import 'package:note_beateditor/Values/AppValues.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: build_Header(context),
      appBar: Build_AppBar(appValues: appValues, context: context),
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
                  Text("Note Count : "+appValues.textedit_NoteLength.text),
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
        ));
  }


  AppBar build_Header(BuildContext context) {
    return AppBar(
        backgroundColor: Datamanager().Color.Appbar_Background,
        title: Text(Datamanager().AppName),
        toolbarHeight: 80,
        actions: [
          Container(
            //color: Colors.white,
            width: Datamanager().Util.Screen(context).width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                      icon: Icon(Icons.folder_open),
                      label: Text("Open"),
                      onPressed: () {
                        getFile();
                      },
                    ),
                    OutlinedButton.icon(
                      icon: Icon(Icons.file_present),
                      label: Text("New"),
                      onPressed: () {},
                    ),
                    OutlinedButton.icon(
                      icon: Icon(Icons.save),
                      label: Text("Save"),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                    width: Datamanager().Util.Screen(context).width * 0.3,
                    child: AutoSizeText("Note name // ", minFontSize: 15, maxFontSize: 20)),
              ],
            ),
          ),
        ],
        bottom: Tab(
            child: Container(
          width: Datamanager().Util.Screen(context).width,
          height: Datamanager().Util.Screen(context).height * 0.1,
          color: Datamanager().Color.CommandBar_Background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText("Note Config"),
              Container(
                  width: Datamanager().Util.Screen(context).width * 0.1,
                  child: TextField(
                    controller: appValues.textedit_GridRow,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        label: Text("Row"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                        )),
                  )),
              Container(
                  width: Datamanager().Util.Screen(context).width * 0.1,
                  child: TextField(
                    controller: appValues.textedit_NoteSeperated,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLines: 1,
                    decoration: InputDecoration(
                        label: Text("Seperated"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                        )),
                  )),
              Container(
                  width: Datamanager().Util.Screen(context).width * 0.1,
                  child: TextField(
                    controller: appValues.textedit_NoteLength,
                    maxLines: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        label: Text("Length"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                        )),
                  )),
              ElevatedButton(
                child: Text("Apply"),
                onPressed: () {
                  setState(() {
                    appValues.list_Note = List.filled(int.parse(appValues.textedit_NoteLength.text), "sea");
                  });
                },
              ),
            ],
          ),
        )));
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
