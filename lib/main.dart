import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Build_AppBar.dart';
import 'package:note_beateditor/Build_BODY.dart';
import 'package:note_beateditor/Build_Bottom.dart';
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
      body: Build_BODY(appValues: appValues,update: update ),
      bottomNavigationBar: Build_Bottom(appValues: appValues, update: update),
      //bottomNavigationBar: build_Bottom(context),
    );
  }
}
