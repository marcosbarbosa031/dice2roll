import 'dart:convert';
import 'dart:io';

import 'package:Dyce/common/drawer.dart';
import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/dice_presets/dice.presets.page.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({Key key, this.title, this.body, this.active, this.presets, this.drawer, this.addButton, this.removeButton, this.preset, this.backgroundColor}): super(key: key);
  final String title;
  final Widget body;
  final int active;
  final List<dynamic> presets;
  final Map<String, dynamic> preset;
  final bool drawer;
  final bool addButton;
  final bool removeButton;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.1,
        title: Text(title),
        actions: <Widget>[
          addButton ? getAddButton(context) : Text(""),
          removeButton ? getRemoveButton(context) : Text("")
        ],
      ),
      drawer: drawer ? AppDrawer(active: active, presets: presets) : null,
      body: body
    );
  }

  Widget getAddButton(BuildContext context) {
    Map<String, dynamic> defaultPreset = {
      "id": presets.length,
      "name": "Default Preset " + presets.length.toString(),
      "dices": [
        {"qtd": 1, "type": 6, "result": "", "mod": 0}
      ]
    };

    return FlatButton(
      color: AppColors.primaryColor,
      textColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 32,
        semanticLabel: "Add a new dice preset.",
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => DiceRoll(preset: defaultPreset, presets: presets)
        ));
      }
    );
  }

  Widget getRemoveButton(BuildContext context) {
    return FlatButton(
      color: AppColors.primaryColor,
      textColor: Colors.white,
      child: Icon(
        Icons.delete_forever,
        color: Colors.white,
        size: 32,
        semanticLabel: "Add a new dice preset.",
      ),
      onPressed: () {
        showDeleteDialog(context);
      }
    );
  }

  /// Display save preset dialog

  Future showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Preset"),
          content: Text("Do you want to delete this preset?"),
          actions: <Widget>[
            Container(
              child: FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            Container(
              child: FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  _deletePreset(context);
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      }
    );
  }

  _deletePreset(BuildContext context) async {
    presets.removeWhere((p) {
      return p["id"] == preset["id"];
    });

    final file = await _localFile;
    file.writeAsString(jsonEncode(presets));

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Dicepresets(presets: presets)
    ));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/presets.json');
  }

}