import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Enter Your email Address',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: const TextStyle(
                        fontFamily: 'AntipastoPro',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      // labelText: 'Email',
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Increase corner radius
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Choose a password',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: const TextStyle(
                        fontFamily: 'AntipastoPro',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      hintText: '************',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Increase corner radius
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Retype your password',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: const TextStyle(
                        fontFamily: 'AntipastoPro',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      hintText: '*************',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Increase corner radius
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 65,
                      width: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(34, 34, 34, 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Validate and submit form
                        },
                        child: Image.asset(
                          'assets/arrow.png',
                          height: 65,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
