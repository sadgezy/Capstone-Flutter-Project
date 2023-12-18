import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';

class FormPill extends StatefulWidget {
  final PageController pageController;
  const FormPill({super.key, required this.pageController});

  @override
  State<FormPill> createState() => _FormPillState();
}

class _FormPillState extends State<FormPill>
    with SingleTickerProviderStateMixin {
  int activePill = 0;
  late AnimationController _controller;
  late Animation _colorAnimationRegister;
  late Animation _colorAnimationLogin;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _colorAnimationRegister = ColorTween(
            begin: AppColors.primaryColor, end: AppColors.backgroundColor)
        .animate(_controller);
    _colorAnimationLogin = ColorTween(
            begin: AppColors.backgroundColor, end: AppColors.primaryColor)
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Container(
          width: screenWidth * 0.5,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                animation: _colorAnimationRegister,
                builder: (context, _) => GestureDetector(
                  onTap: () {
                    setState(() {
                      activePill = 0;
                      _controller.reverse();
                    });
                    widget.pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                      height: 100,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: _colorAnimationRegister.value,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontFamily: 'AntipastoPro',
                              fontSize: 20,
                              fontWeight: activePill == 0
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: activePill == 0
                                  ? Color.fromRGBO(255, 255, 255, 1)
                                  : AppColors.primaryColor),
                        ),
                      )),
                ),
              ),
              AnimatedBuilder(
                animation: _colorAnimationLogin,
                builder: (context, _) => GestureDetector(
                  onTap: () {
                    setState(() {
                      activePill = 1;
                      _controller.forward();
                    });
                    widget.pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    height: 100,
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      color: _colorAnimationLogin.value,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 20,
                          fontWeight: activePill == 1
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: activePill == 1
                              ? Color.fromRGBO(255, 255, 255, 1)
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
