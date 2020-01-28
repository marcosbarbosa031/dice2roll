import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/dice_presets/dice.presets.page.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key, this.active, this.presets}): super(key: key);
  final int active;
  final List<dynamic> presets;

  @override
  Widget build (BuildContext context) => Drawer(
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
          title: Text('Dice Presets', style: TextStyle(color: AppColors.primaryColor)),
          onTap: () {
            Navigator.pop(context);
            if (active != 0) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Dicepresets(presets: presets)
              ));
            }
          },
        ),

        ListTile(
          title: Text('Logout', style: TextStyle(color: AppColors.primaryColor)),
          onTap: () {
            // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}