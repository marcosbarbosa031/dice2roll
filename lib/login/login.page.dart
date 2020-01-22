
import 'package:Dice2Roll/login/login.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dice2Roll/user_repository/user.repository.dart';
import 'package:Dice2Roll/authentication/authentication.dart';
import 'package:Dice2Roll/login/login.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final UserRepository userRepository;

  LoginPage({Key key, this.title, @required this.userRepository})
    : assert(userRepository != null), super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: widget.userRepository,
          );
        },
        child: LoginForm()
      ),
    );
  }
}