import 'package:Dyce/common/drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({Key key, this.title, this.body, this.active, this.presets}): super(key: key);
  final String title;
  final Widget body;
  final int active;
  final List<dynamic> presets;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title)
    ),
    drawer: AppDrawer(active: active, presets: presets),
    body: body
  );
}