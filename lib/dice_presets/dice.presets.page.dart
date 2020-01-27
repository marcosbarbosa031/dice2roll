
import 'package:Dyce/common/drawer.dart';
import 'package:Dyce/common/scaffold.dart';
import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';

class Dicepresets extends StatefulWidget {
  @override
  _DicepresetsState createState() => _DicepresetsState();
}

class _DicepresetsState extends State<Dicepresets> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> presets = [
    {
      "name": "Preset 1",
      "dices": [
        {'qtd': 1, 'type': 6, 'result': "", 'mod': 0},
        {'qtd': 1, 'type': 20, 'result': "", 'mod': 0},
      ]
    },

  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Presets",
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: getpresetsRow(presets),
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