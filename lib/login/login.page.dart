
import 'package:Dyce/common/theme.data.dart';
import 'package:Dyce/login/login.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Dyce/user_repository/user.repository.dart';
import 'package:Dyce/authentication/authentication.dart';
import 'package:Dyce/login/login.dart';

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
      backgroundColor: AppColors.primaryColor,
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