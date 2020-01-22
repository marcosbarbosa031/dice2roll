

import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text
        )
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            )
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Image.asset('assets/icon_w.png'),
                  
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style:  new TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white)
                    ),
                    controller: _usernameController,
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
                    controller: _passwordController,
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 60,
                    child: RaisedButton(
                      onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
                      color: Colors.white,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}