
import 'dart:convert';
import 'dart:io';

import 'package:Dyce/common/scaffold.dart';
import 'package:Dyce/common/theme.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

class DiceRoll extends StatefulWidget {
  DiceRoll({Key key, this.preset, this.presets}) : super(key: key);

  final Map<String, dynamic> preset;
  final List<dynamic> presets;

  _DiceRollState createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  final rng = new Random();
  List<dynamic> dices;
  String total = "";
  final presetNameC = TextEditingController();
  @override
  void initState () {
    super.initState();

    presetNameC.value = presetNameC.value.copyWith(
      text: widget.preset["name"]
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      dices = widget.preset["dices"];
    });

    return AppScaffold(
      active: 1,
      presets: widget.presets,
      title: widget.preset["name"],
      drawer: false,
      addButton: false,
      removeButton: true,
      preset: widget.preset,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              // Row of Dices
              Expanded(
                child: ListView(
                  children: getDiceRows(dices),
                ),
              ),

              // Result with Total Amount
              Column(
                children: <Widget>[
                  Container(
                    height: 36,
                    child: Text(
                      "$total",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24
                      ),
                    ),
                  )
                ],
              ),

              // Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.sd_card),
                      label: Text("Save", style: TextStyle(fontSize: 18)),
                      color: Colors.white,
                      textColor: AppColors.primaryColor,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        showSaveDialog(context);
                      },
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: ButtonTheme(
                      height: 90,
                      child: RaisedButton(
                        child: Image.asset('assets/dice.png', width: 56),
                        textColor: Colors.white,
                        color: AppColors.primaryColor,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50)),
                        onPressed: () {
                          _rollDice(dices);
                        },
                      )
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text("Add", style: TextStyle(fontSize: 18)),
                      textColor: AppColors.primaryColor,
                      color: AppColors.sencondaryColor,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        _addDice();
                      },
                    )
                  ),
                ],
              )
            ],
          )
        ),
      )
    );
  }

  /// Create the List of Widgets that represents the Dice Row.
  /// 
  /// @param dices The List of a Map that represents a dice row.

  List<Widget> getDiceRows (List dices) {
    List<Widget> diceRows = new List<Widget>();
    for (int i = 0; i < dices.length; i++) {
      var d = dices[i];
      TextEditingController _modController = new TextEditingController(text: d["mod"].toString());
      diceRows.add(Divider());
      diceRows.add(Row(
          children: <Widget>[
            // Left side Row
            Expanded(
              // flex: 7,
              child: Column(
                // height: ,
                children: <Widget>[
                  // Top Row
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Dice:"),
                      ),

                      Expanded(
                        child: DropdownButton<int>(
                          value: d["type"],
                          onChanged: (int newValue) {
                            setState(() {
                              d["type"] = newValue;
                            });
                          },
                          items: <int>[3, 4, 6, 8, 10, 12, 20]
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text("D$value"),
                            );
                          }).toList(),
                        ),
                      ),
                      
                      Expanded(
                        // flex: 1,
                        child: Text("Qty:"),
                      ),

                      Expanded(
                        // flex: 1,
                        child: new DropdownButton<int>(
                          value: d["qtd"],
                          onChanged: (int newValue) {
                            setState(() {
                              d["qtd"] = newValue;
                            });
                          },
                          items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ),

                      // Mods Text
                      Expanded(
                        flex: 1,
                        child: Text("Mods:"),
                      ),

                      // Numeric input
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _modController,
                          onChanged: (text) {
                            if (text == "") {
                              d["mod"] = 0;
                            } else {
                              d["mod"] = int.parse(text);
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        ),
                      ),

                      // Delete Icon
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            tooltip: "Remove",
                            color: Colors.redAccent,
                            onPressed: dices.length == 1 ? null : () {_removeThisRow(i);}
                          ),
                        )
                      ),
                    ],
                  ),

                  // Bottom Row
                  Row(
                    children: <Widget>[
                      // Dice result
                      Expanded(
                        // flex: 3,
                        child: Center(
                          heightFactor: 1.5,
                          child: Text(
                            "${d['result']}",
                            style: TextStyle(
                              fontSize: 15
                            ),
                            // style: Theme.of(context).textTheme.display1,
                          ),
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      );

      diceRows.add(Divider());
    }

    return diceRows;
  }

  /// Roll the dices and update it's results.
  /// 
  /// @param dices The List of a Map that represents a dice row.

  void _rollDice(List dices) {
    int roll = 0;
    int sumTotal = 0;
    for (var d in dices) {
      int sumDices = 0;
      String res = "";
      for (int i = 0; i < d['qtd']; i++) {
        roll = rng.nextInt(d['type']) + 1;
        if (i == 0) {
          res = res+"$roll";
        } else {
          res = res+" + $roll";
        }
        sumDices = sumDices + roll;
      }

      // Sum the mod
      sumDices = sumDices + d["mod"];

      setState(() {
        d['result'] = res+" + (${d['mod']}) = $sumDices";
      });
      sumTotal = sumTotal + sumDices;
    }
    setState(() {
      total = "Result: $sumTotal"; 
    });
  }

  /// Adds another Dice row with default values.

  void _addDice() {
    dices.add({'qtd': 1, 'type': 6, 'result': "", 'mod': 0});
    List<dynamic> aux = dices;
    setState(() {
     dices = aux;
    });
  }

  /// Remove Dice row by index.
  /// 
  /// @param index The index of the element to remove.

  void _removeThisRow(int index) {
    dices.removeAt(index);
    List<dynamic> aux = dices;
    if (aux.length > 1) {
      setState(() {
        dices = aux;
      });
    } else {
      setState(() {
        dices = aux;
      });

    }
  }

  /// Save the dices preset.

  void _savePreset() async {
    widget.preset["name"] = presetNameC.value.text;

    if (widget.preset["id"] >= widget.presets.length) {
      widget.presets.add(widget.preset);
    }

    final file = await _localFile;
    file.writeAsString(jsonEncode(widget.presets));
  }

  /// Display save preset dialog

  Future showSaveDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Save Preset"),
          content: TextFormField(
            style:  new TextStyle(color: Colors.black, fontSize: 20),
            controller: presetNameC,
            decoration: InputDecoration(
              labelText: "Preset name",
              labelStyle: TextStyle(color: AppColors.primaryColor)
            ),
          ),
          actions: <Widget>[
            Container(
              child: FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            Container(
              child: FlatButton(
                child: Text("Save"),
                onPressed: () {
                  _savePreset();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      }
    );
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