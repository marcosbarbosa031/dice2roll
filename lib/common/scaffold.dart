import 'package:Dyce/common/drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({Key key, this.title, this.body, this.active}): super(key: key);
  final String title;
  final Widget body;
  final int active;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title)
    ),
    drawer: AppDrawer(active: active),
    body: body
  );
}