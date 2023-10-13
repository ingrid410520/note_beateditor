import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_beateditor/Data/AppValues.dart';

import 'Data/Datamanager.dart';

class Build_BODY extends StatefulWidget {
  const Build_BODY({
    super.key,
    required this.appValues,
    required this.context,
  });

  final AppValues appValues;
  final BuildContext context;

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

    return GridView.builder(
      shrinkWrap: true,
      itemCount: iLength,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: iRow,
          childAspectRatio: iSep.toDouble(),
          crossAxisSpacing: 5,
          mainAxisSpacing: 50),
      itemBuilder: (context, sec_index) {
        //setState(() {});
        return GridView.builder(
          itemCount: iSep,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: iSep,
              //childAspectRatio: 0.5,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10),
          itemBuilder: (context, sep_index) {
            int index1 = sec_index+1;
            int index2 = sep_index+1;
            return GridTile(
                child: OutlinedButton(
              child: AutoSizeText("Sec $index1 - $index2",
                  maxLines: 2, maxFontSize: 20),
              style: OutlinedButton.styleFrom(
                  alignment: Alignment.topCenter,
                  backgroundColor: Datamanager().Color.Note_Background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              onPressed: () {
                //setState(() {});
              },
            ));
          },
        );
      },
    );
  }
}
