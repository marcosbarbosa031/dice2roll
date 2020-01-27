import 'dart:convert';
import 'dart:io';

import 'package:Dyce/dice_presets/dice.presets.page.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> presets = [];
  Map<String, dynamic> defaultPreset = {
    "name": "Default Preset",
    "dices": [
      {"qtd": 1, "type": 6, "result": "", "mod": 0}
    ]
  };

  // @override
  void initState () {
    super.initState();
    readcontent().then((content) {
      print("content: $content");
      if (content != false) {
        List<Map<String, dynamic>> arr = new List<Map<String, dynamic>>();
        arr.add(content);
        setState(() {
          presets = arr;
        });
      } else {
        setState(() {
          presets = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (presets != null) {
      return Dicepresets(presets: presets);
    } else {
      return DiceRoll(preset: defaultPreset);
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory 
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('{"name":"Preset 1","dices":[{"qtd":1,"type":6,"result":"","mod":0},{"qtd":1,"type":20,"result":"","mod":0}]}');
  }

  readcontent() async {
    try {
      final file = await _localFile;
      // Read the file
      String stringData = await file.readAsString();
      var content = json.decode(stringData);
      // print(content['channelURL']);
      return content;
    } catch (e) {
      // If there is an error reading, return a default String
      print(e.toString());
      return false;
    }
  }
}