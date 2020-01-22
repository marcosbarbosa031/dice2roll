import 'package:flutter/material.dart';

class AppColors {
  static Map<int, Color> primary = {
    50:Color.fromRGBO(36,120,183, .1),
    100:Color.fromRGBO(36,120,183, .2),
    200:Color.fromRGBO(36,120,183, .3),
    300:Color.fromRGBO(36,120,183, .4),
    400:Color.fromRGBO(36,120,183, .5),
    500:Color.fromRGBO(36,120,183, .6),
    600:Color.fromRGBO(36,120,183, .7),
    700:Color.fromRGBO(36,120,183, .8),
    800:Color.fromRGBO(36,120,183, .9),
    900:Color.fromRGBO(36,120,183, 1),
  };

  static Map<int, Color> secondary = {
    50:Color.fromRGBO(98,204,219, .1),
    100:Color.fromRGBO(98,204,219, .2),
    200:Color.fromRGBO(98,204,219, .3),
    300:Color.fromRGBO(98,204,219, .4),
    400:Color.fromRGBO(98,204,219, .5),
    500:Color.fromRGBO(98,204,219, .6),
    600:Color.fromRGBO(98,204,219, .7),
    700:Color.fromRGBO(98,204,219, .8),
    800:Color.fromRGBO(98,204,219, .9),
    900:Color.fromRGBO(98,204,219, 1),
  };

  static MaterialColor primaryColor = MaterialColor(0xFF2478b7, primary);
  static MaterialColor sencondaryColor = MaterialColor(0xFF62ccdb, secondary);
}