import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_beateditor/Data/AppValues.dart';
import 'package:note_beateditor/Data/Note.dart';

import 'Data/Datamanager.dart';

class Build_BODY extends StatefulWidget {
  const Build_BODY({
    super.key,
    required this.appValues,
    required this.update
  });

  final AppValues appValues;
  final Function update;

  @override
  State<Build_BODY> createState() => _Build_BODYState();
}

class _Build_BODYState extends State<Build_BODY> {
  callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Datamanager().Color.App_Background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Screen Size\n W : " +
                  Datamanager().Util.Screen(context).width.toString() +
                  " H : " +
                  Datamanager().Util.Screen(context).height.toString()),
              Text(AppValues().list_Note.length.toString()),
              build_Grid()
            ],
          ),
        ),
      ),
    );
  }

  GridView build_Grid() {
    int iLength = widget.appValues.NoteLength;
    int iRow = widget.appValues.Grid_Row;
    int iSep = widget.appValues.NoteSepreated;
    AppValues().list_Note.clear();
    widget.update;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: iLength,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: iRow, childAspectRatio: iSep.toDouble()*0.5, crossAxisSpacing: 5, mainAxisSpacing: 15),
      itemBuilder: (context, sec_index) {
        //setState(() {});
        return GridView.builder(
          itemCount: iSep,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: iSep,
              childAspectRatio: 0.5,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10),
          itemBuilder: (context, sep_index) {
            int index1 = sec_index + 1;
            int index2 = sep_index + 1;
            var inst = Note(Sec: index1, Sep: index2);
            AppValues().list_Note.add(inst);
            print("Length : " + AppValues().list_Note.length.toString());

            //AppValues().list_Note.
            return inst;
          },
        );
      },
    );
  }
}
