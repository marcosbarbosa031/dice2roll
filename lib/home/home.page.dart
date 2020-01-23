import 'package:Dyce/authentication/authentication.dart';
import 'package:Dyce/common/theme.data.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // actions: <Widget>[
        //   FlatButton.icon(
        //     icon: Icon(Icons.exit_to_app),
        //     label: Text("Sair"),
        //     textColor: Colors.white,
        //     color: AppColors.primaryColor,
        //     onPressed: () {
        //       BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        //     },
        //   )
        // ]
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                image: DecorationImage(image: AssetImage("assets/icon_w.png", ))
              ),
            ),
            ListTile(
              title: Text('Presets', style: TextStyle(color: AppColors.primaryColor)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout', style: TextStyle(color: AppColors.primaryColor)),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: DiceRoll()
    );
  }
}