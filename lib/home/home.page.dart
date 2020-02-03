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
  List<dynamic> presets = [];

  // @override
  void initState () {
    super.initState();
    readcontent().then((content) {
      print("content: $content");
      if (content != false) {
        setState(() {
          presets = content;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dicepresets(presets: presets);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/presets.json');
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