import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image.asset('assets/icon.png')
            ),

            // Expanded(
            //   // flex: 2,
            //   child: Text(
            //     title,
            //     style: TextStyle(
            //       color: AppColors.primaryColor,
            //       fontSize: 32,
            //       fontWeight: FontWeight.bold
            //     ),
            //   )
            // )
          ],
        )
      )
    );
  }
}
