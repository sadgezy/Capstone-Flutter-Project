import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/custombtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.black,
      child: Container(
          height: screenHeight * 0.9,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: screenHeight * 0.9,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bill-ease',
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 13, 13, 1),
                                  fontSize: 50,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              Image.asset(
                                'assets/logo_final.png',
                                height: 70,
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: Color.fromRGBO(13, 13, 13, 1),
                              fontSize: 20,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                width: screenWidth,
                                margin: EdgeInsets.only(top: 16),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 83, 83, 83)
                                              .withOpacity(0.8),
                                      spreadRadius: 2,
                                      blurRadius: 20,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'User Name',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            height: screenHeight * 0.1,
                                            child: TextFormField(
                                              cursorColor:
                                                  AppColors.secondaryColor,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors
                                                        .secondaryColor, // Change this color to your liking
                                                    width: 2.0,
                                                  ),
                                                ),
                                                contentPadding: EdgeInsets.all(
                                                    16.0), // Increase the size of the text input area
                                                hintText: 'Enter your username',
                                              ),
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter a value';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Password',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            height: screenHeight * 0.1,
                                            child: TextFormField(
                                              cursorColor:
                                                  AppColors.accentColor,
                                              obscureText: _obscureText,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  borderSide: BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.all(16.0),
                                                hintText: 'Enter your password',
                                                suffixIcon: IconButton(
                                                  color: AppColors.accentColor,
                                                  icon: Icon(
                                                    // Choose the icon based on the visibility state
                                                    _obscureText
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                  ),
                                                  onPressed:
                                                      _togglePasswordVisibility,
                                                ),
                                              ),
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter a value';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(right: 16),
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                'Don\'t have an account?')),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CustomButton(
                                              title: 'Login  >',
                                              buttonColor:
                                                  AppColors.accentColor,
                                              textColor: AppColors.textColor,
                                              width: screenWidth * 0.5,
                                              onPressed: () {
                                                Get.toNamed('');
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ])),
            ],
          )),
    );
  }
}
