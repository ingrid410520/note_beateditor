
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_beateditor/Values/AppValues.dart';

import 'Data/Datamanager.dart';

class Build_BODY extends StatelessWidget {
  const Build_BODY({
    super.key,
    required this.appValues,
    required this.context,
  });

  final AppValues appValues;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Datamanager().Color.App_Background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(Datamanager().Util.Screen(context).width.toString() +
                  " " +
                  Datamanager().Util.Screen(context).height.toString()),
              GridView.builder(
                shrinkWrap: true,
                itemCount: int.parse(appValues.textedit_NoteLength.text),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: int.parse(appValues.textedit_GridRow.text),
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GridTile(
                      child: OutlinedButton(
                        child: AutoSizeText("Sec $index", maxLines: 1, maxFontSize: 20),
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.topCenter,
                            backgroundColor: Datamanager().Color.Note_Background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () {},
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
