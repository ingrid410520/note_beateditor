
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'Data/Datamanager.dart';
import 'main.dart';

class Build_BODY extends StatefulWidget {
  const Build_BODY({
    super.key,
    required this.appValues,
  });

  final AppValues appValues;

  @override
  State<Build_BODY> createState() => _Build_BODYState();
}

class _Build_BODYState extends State<Build_BODY> {
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
                itemCount: int.parse(widget.appValues.NoteLength.text),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: int.parse(widget.appValues.GridRow.text),
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
