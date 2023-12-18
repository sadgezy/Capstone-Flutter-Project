import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/presentation/screen/login_signup/form_mode_pill.dart';
import 'package:bill_splitter/presentation/screen/login_signup/login_form.dart';
import 'package:bill_splitter/presentation/screen/login_signup/signup_form.dart';
import 'package:flutter/material.dart';

class LoginReg extends StatefulWidget {
  const LoginReg({super.key});

  @override
  State<LoginReg> createState() => _LoginRegState();
}

class _LoginRegState extends State<LoginReg>
    with SingleTickerProviderStateMixin {
  int activePill = 0;
  late AnimationController _controller;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Stack(children: [
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Image.asset(
                        'assets/logo.png',
                        height: 100,
                      ))),
                ),
                // const Align(
                //   alignment: Alignment.center,
                //   child: Padding(
                //       padding: const EdgeInsets.all(16.0),
                //       child: Center(child: Text('Split Up'))),
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              height: screenHeight * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [FormPill(pageController: _pageController)],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                height: screenHeight * 0.6 +
                    MediaQuery.of(context).viewInsets.bottom,
                child: PageView(
                  physics: new NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {},
                  controller: _pageController,
                  children: [
                    //signup page
                    SignupForm(),
                    //Login Page
                    LoginForm()
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
