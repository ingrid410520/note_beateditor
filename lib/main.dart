import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_beateditor/Data/Datamanager.dart';

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
  TextEditingController _GridRow = TextEditingController(text: "15");
  TextEditingController _NoteSeperated = TextEditingController(text: "1");
  TextEditingController _NoteLength = TextEditingController(text: "50");

  List<String> listNote = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        onPressed: () {},
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
                      controller: _GridRow,
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
                      controller: _NoteSeperated,
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
                      controller: _NoteLength,
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
                      listNote = List.filled(int.parse(_NoteLength.text), "sea");
                    });
                  },
                ),
              ],
            ),
          ))),
      body: SingleChildScrollView(
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
                  itemCount: int.parse(_NoteLength.text),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: int.parse(_GridRow.text),
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
      ),
      bottomNavigationBar: BottomAppBar(
          color: Datamanager().Color.Appbar_Background,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
          )),
    );
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
