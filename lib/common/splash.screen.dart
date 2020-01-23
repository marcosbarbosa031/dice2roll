import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() => _SplashScreenState();
  // @override
  // _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Timer _timer;
  // FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  // _SplashScreenState() {
  //   _timer = Timer(Duration(seconds: 2), () {
  //     setState(() {
  //       _logoStyle = FlutterLogoStyle.horizontal;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Animator(
                        duration: Duration(seconds: 1),
                        builder: (Animation anim) => FadeTransition(
                          opacity: anim,
                          child: Image.asset('assets/icon.png')
                        ),
                      ),
                      // Image.asset('assets/icon.png')
                    ],
                  ),
                ),
              ),

              // Expanded(
              //   flex: 1,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(AppColors.primaryColor)),
              //       Padding(
              //         padding: EdgeInsets.only(top: 20),
              //       )
              //     ],
              //   ),
              // )
            ],
          )
        ],
      )
    );
  }
}