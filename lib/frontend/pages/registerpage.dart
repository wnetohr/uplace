import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/components/uplace_theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.greenUplace,size: 35),
        backgroundColor: AppColors.blueUplace,
        centerTitle: true,
        title: Text('Registrar conta',style: TextStyle(color: AppColors.greenUplace),),
      ),
      body: Center(
        child: Container(
        ),
      ),
    );
  }
}
