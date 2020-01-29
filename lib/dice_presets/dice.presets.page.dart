import 'package:Dyce/common/scaffold.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';

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
      presets: widget.presets,
      title: "Dice Presets",
      drawer: true,
      addButton: true,
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
               builder: (BuildContext context) => DiceRoll(preset: p, presets: widget.presets)
             ));
          },
        )
      );
    }

    if (presets.length == 0) {
      presetsRow.add(
        ListTile(
          title: Text("There's no preset saved. Add a new preset.", style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15
          )),
        )
      );
    }


    return presetsRow;
  }
}