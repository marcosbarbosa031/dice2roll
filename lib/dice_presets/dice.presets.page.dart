
import 'dart:convert';
import 'dart:io';

import 'package:Dyce/common/drawer.dart';
import 'package:Dyce/common/scaffold.dart';
import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Dicepresets extends StatefulWidget {
  Dicepresets({Key key, this.presets}): super(key: key);
  final presets;
  @override
  _DicepresetsState createState() => _DicepresetsState();
}

class _DicepresetsState extends State<Dicepresets> {

  @override
  Widget build(BuildContext context) {
    // print("presets: "+widget.presets);
    return AppScaffold(
      active: 0,
      title: "Presets",
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: getpresetsRow(widget.presets),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  List<Widget> getpresetsRow(List presets) {
    List<Widget> presetsRow = new List<Widget>();
    for (int i = 0; i < presets.length; i++) {
      var p = presets[i];
      presetsRow.add(
        ListTile(
          title: Text(p['name']),
          onTap: () {
             Navigator.of(context).push(MaterialPageRoute(
               builder: (BuildContext context) => DiceRoll(preset: p)
             ));
          },
        )
      );
    }

    return presetsRow;
  }
}