import 'package:Dyce/authentication/authentication.dart';
import 'package:Dyce/common/drawer.dart';
import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/dice_presets/dice.presets.page.dart';
import 'package:Dyce/dice_roll/dice.roll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Dicepresets();
  }
}