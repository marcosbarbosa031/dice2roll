import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rng = new Random();
  List<Map<String, dynamic>> dices = [{'qtd': 1, 'type': 6, 'result': ""}];
  String result = "";
  String total = "";

  /// Create the List of Widgets that represents the Dice Row
  /// 
  /// @param dices The List of a Map that represents a dice row

  List<Widget> getDiceRows (List dices) {
    List<Widget> diceRows = new List<Widget>();
    for (var d in dices) {
      diceRows.add(Divider());
      diceRows.add(Row(
          children: <Widget>[
            Expanded(
              // flex: 1,
              child: Text("Dados:"),
            ),

            Expanded(
              // flex: 1,
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
              child: Text("Qtd:"),
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

            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "${d['result']}",
                  // style: Theme.of(context).textTheme.display1,
                ),
              )
            ),
          ],
        )
      );

      diceRows.add(Divider());
    }

    return diceRows;
  }

  /// Roll the dices and update it's results
  /// 
  /// @param dices The List of a Map that represents a dice row

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

      setState(() {
        if (res.length > 2){
          d['result'] = res+" = $sumDices";
        } else {
          d['result'] = res;
        }
      });
      sumTotal = sumTotal + sumDices;
    }
    setState(() {
      total = "Total: $sumTotal"; 
    });
  }

  /// Adds another Dice row with default values

  void _addDice() {
    dices.add({'qtd': 1, 'type': 6, 'result': ""});
    List<Map<String, dynamic>> aux = dices;
    setState(() {
     dices = aux;
    });
  }

  /// Deletes the last Dice row but not if there's only one

  void _deleteDice() {
    if (dices.length > 1) {
      dices.removeLast();
      List<Map<String, dynamic>> aux = dices;
      setState(() {
      dices = aux;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                    height: 30,
                    child: Text(
                      "$total",
                      style: Theme.of(context).textTheme.title
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
                      icon: Icon(Icons.add),
                      label: Text("Adicionar"),
                      textColor: Colors.white,
                      color: Colors.greenAccent,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        _addDice();
                      },
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.autorenew),
                      label: Text("Rolar"),
                      textColor: Colors.white,
                      color: Colors.deepPurpleAccent,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        _rollDice(dices);
                      },
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.delete_forever),
                      label: Text("Remover"),
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        _deleteDice();
                      },
                    )
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}