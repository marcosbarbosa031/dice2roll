import 'package:Dyce/common/theme.data.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
      )
    )
  );
}