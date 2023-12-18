import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      margin: EdgeInsets.only(
        top: 16,
        right: 100,
        bottom: 16,
      ),
      height: screenHeight,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                right: 12.0,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/drawer/cancel.png',
                      scale: 3,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: <Widget>[
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/drawer/person.png',
                            scale: 3,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                      Text(
                        'my profile',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/drawer/security_shield.png',
                            scale: 3,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                      Text(
                        'security',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/drawer/handshake.png',
                            scale: 3,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                      Text(
                        'partners',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/drawer/questions.png',
                            scale: 3,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                      Text(
                        'help center',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/drawer/gear.png',
                            scale: 3,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                      Text(
                        'settings',
                        style: TextStyle(
                          fontFamily: 'AntipastoPro',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //go back to login screen
            },
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/drawer/logout.png',
                        scale: 3,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                  Text(
                    'logout',
                    style: TextStyle(
                      fontFamily: 'AntipastoPro',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
