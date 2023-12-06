import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/custombtn.dart';
import 'package:bill_splitter/presentation/screen/login_screen/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final LoginController loginCont = LoginController();
    return Container(
        child: CustomButton(
      title: 'Login',
      buttonColor: AppColors.accentColor,
      textColor: AppColors.textColor,
      width: screenWidth * 0.9,
      onPressed: () {
        print('pressed');
        loginCont.goToPage(0);
      },
    ));
  }
}
