enum NScript {
  none,
  custom,
  singleStep_Executor,
  multiStep_Executor,
  hitCheck,
  sound_Bgm,
  sound_Effect,
  sound_Action,
  objectControl,
}

List listScriptType = [
  [NScript.none, 'None'],
  [NScript.custom, 'Custom'],
  [NScript.singleStep_Executor, 'SingleStep'],
  [NScript.multiStep_Executor, 'MultiStep'],
  [NScript.hitCheck, 'HitCheck'],
  [NScript.sound_Bgm, 'Sound_Bgm'],
  [NScript.sound_Effect, 'Sound_Effect'],
  [NScript.sound_Action, 'Sound_Action'],
  [NScript.objectControl, 'Object_Control'],
];

class ScriptInfo {
  String getScriptTypeString(NScript e) {
    String result = "";
    List ScriptString = List.generate(listScriptType.length, (index) {
      var vItem = listScriptType[index];
      return vItem[1];
    });

    result = ScriptString[e.index];

    return result;
  }

  List<String> getScriptTypeStringList() {
    List<String> List_ScriptString = List.generate(listScriptType.length, (index) {
      var vItem = listScriptType[index];
      return vItem[1];
    });

    return List_ScriptString;
  }

  NScript getScriptTypeFromString(String strType) {
    NScript result = NScript.none;

    listScriptType.forEach((element) {
      String vStr = element[1];
      if (vStr == strType) {
        result = element[0] ;
        //break;
      }
    });

    return result;
  }
}
