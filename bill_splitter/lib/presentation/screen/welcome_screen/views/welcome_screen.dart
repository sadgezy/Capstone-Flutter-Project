import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/custombtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.black,
      child: Container(
          height: screenHeight * 0.9,
          // padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: screenHeight * 0.7,
                  child: Column(
                    children: [
                      Center(child: Image.asset('assets/logo_final.png')),
                      const Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bill-ease',
                          style: TextStyle(
                            color: Color.fromRGBO(13, 13, 13, 1),
                            fontSize: 50,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      )),
                      const Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Billsplitting done with ease',
                          style: TextStyle(
                            color: Color.fromRGBO(13, 13, 13, 1),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      )),
                      Expanded(child: Container()),
                      Container(
                          width: screenWidth,
                          margin: EdgeInsets.only(top: 16),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                title: 'Get Started  >',
                                buttonColor: AppColors.accentColor,
                                textColor: AppColors.textColor,
                                width: screenWidth * 0.35,
                                onPressed: () {
                                  Get.toNamed('/login');
                                },
                              ),
                            ],
                          )),
                    ],
                  )),
            ],
          )),
    );
  }
}
