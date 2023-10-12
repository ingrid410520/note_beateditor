import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Data/Datamanager.dart';
import 'package:note_beateditor/Function/Function_OpneNote.dart';
import 'package:note_beateditor/Values/AppValues.dart';

class Build_AppBar extends StatefulWidget implements PreferredSizeWidget {
  const Build_AppBar(
      {super.key, required this.appValues, required this.context});

  final AppValues appValues;
  final BuildContext context;
  @override
  Size get preferredSize {
    return Size.fromHeight(120);
  }
  @override
  State<Build_AppBar> createState() => _Build_AppBarState();
}

class _Build_AppBarState extends State<Build_AppBar> {
  @override
  Size get preferredSize {
    return Size.fromHeight(120);
  }

  @override
  void initState()
  {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _Row = widget.appValues.textedit_GridRow;
    TextEditingController _Sep = widget.appValues.textedit_NoteSeperated;
    TextEditingController _Length = widget.appValues.textedit_NoteLength;
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
                    child: AutoSizeText("Note name // ",
                        minFontSize: 15, maxFontSize: 20)),
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
                    widget.appValues.textedit_GridRow.text = _Row.text;
                    widget.appValues.textedit_NoteSeperated = _Sep;
                    widget.appValues.textedit_NoteLength = _Length;
                  });
                  //appValues.list_Note = List.filled(int.parse(appValues.textedit_NoteLength.text), "sea");
                },
              ),
            ],
          ),
        )));
  }
}
