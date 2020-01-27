import 'package:Dyce/common/drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({Key key, this.title, this.body}): super(key: key);
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title)
    ),
    drawer: AppDrawer(),
    body: body
  );
}