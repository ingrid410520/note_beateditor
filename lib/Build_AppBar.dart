import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Data/Datamanager.dart';
import 'package:note_beateditor/Function/Function_OpneNote.dart';
import 'package:note_beateditor/Data/AppValues.dart';

class Build_AppBar extends StatefulWidget implements PreferredSizeWidget {
  Build_AppBar({super.key, required this.appValues, required this.update});

  final AppValues appValues;
  final Function update;

  @override
  Size get preferredSize => _Build_AppBarState().preferredSize;

  @override
  State<Build_AppBar> createState() => _Build_AppBarState();
}

class _Build_AppBarState extends State<Build_AppBar> {
  final TextEditingController _Row = TextEditingController();
  final TextEditingController _Sep = TextEditingController();
  final TextEditingController _Length = TextEditingController();

  @override
  initState() {
    super.initState();

    _Row.text = widget.appValues.Grid_Row.toString();
    _Sep.text = widget.appValues.NoteSepreated.toString();
    _Length.text = widget.appValues.NoteLength.toString();
  }

  callback() {
    setState(() {
      widget.update!();
    });
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(120);
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: _Row,
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
                    controller: _Sep,
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
                    controller: _Length,
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
                    callback();
                    widget.appValues.Grid_Row = int.parse(_Row.text);
                    widget.appValues.NoteSepreated = int.parse(_Sep.text);
                    widget.appValues.NoteLength = int.parse(_Length.text);
                    print("Appbar : " + widget.appValues.Grid_Row.toString());
                  });
                  //appValues.list_Note = List.filled(int.parse(appValues.textedit_NoteLength.text), "sea");
                },
              ),
            ],
          ),
        )));
  }
}
