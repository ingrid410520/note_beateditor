import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/main.dart';

import 'Data/Datamanager.dart';
import 'Function/Function_OpneNote.dart';

class Build_HEADER extends StatefulWidget implements PreferredSizeWidget {
  Build_HEADER({
    super.key,
    required this.appValues,
  });

  final AppValues appValues;

  @override
  State<Build_HEADER> createState() => _Build_HEADERState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _Build_HEADERState extends State<Build_HEADER> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Datamanager().Color.Appbar_Background,
        title: Text(Datamanager().AppName),
        toolbarHeight: 80,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: Datamanager().Util.Screen(context).width * 0.3,
                  child: AutoSizeText("Note name // ",
                      minFontSize: 15, maxFontSize: 20)),
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
                    controller: widget.appValues.GridRow,
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
                    controller: widget.appValues.NoteSeperated,
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
                    controller: widget.appValues.NoteLength,
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
                    print("Header : "+widget.appValues.NoteLength.text );
                    widget.appValues.listNote = List.filled(
                        int.parse(widget.appValues.NoteLength.text), "sep");
                  });
                },
              ),
            ],
          ),
        )));
  }
}
