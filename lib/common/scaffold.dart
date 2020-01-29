import 'package:Dyce/common/drawer.dart';
import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({Key key, this.title, this.body, this.active, this.presets, this.drawer, this.addButton}): super(key: key);
  final String title;
  final Widget body;
  final int active;
  final List<dynamic> presets;
  final bool drawer;
  final bool addButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          addButton ? getAddButton(context) : Text("")
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

}