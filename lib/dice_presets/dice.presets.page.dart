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
      preset: null,
      title: "Dice Presets",
      drawer: true,
      addButton: true,
      removeButton: false,
      backgroundColor: Color.fromRGBO(36,120,183, 1),
      body: Padding(
        padding: EdgeInsets.all(0),
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
        Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(36,120,183, .8)),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                child: Image.asset('assets/preset.png', width: 36),
              ),
              title: Text(p['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DiceRoll(preset: p, presets: widget.presets)
                ));
              },
            )
          ),
        )
      );
    }

    if (presets.length == 0) {
      presetsRow.add(
        ListTile(
          title: Text("There's no preset saved. Add a new preset.", style: TextStyle(
            color: Colors.white,
            fontSize: 15
          )),
        )
      );
    }


    return presetsRow;
  }
}