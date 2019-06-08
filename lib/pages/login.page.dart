
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style:  new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              Divider(),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                style:  new TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              Divider(),
              ButtonTheme(
                height: 60,
                child: RaisedButton(
                  onPressed: () => {},
                  color: Colors.white,
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}