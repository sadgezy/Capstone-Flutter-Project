import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Size screenSize;
  final Color backgroundColor;
  const HomeAppBar(
      {super.key,
      required this.screenSize,
      this.backgroundColor = const Color.fromRGBO(254, 254, 255, 1)});

  @override
  Size get preferredSize =>
      Size(screenSize.width, 90.0); // You can adjust the height as needed.

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    var size = widget.screenSize;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/homescreen/menu.png',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/logo.png',
                  height: size.height * 0.04,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  'assets/homescreen/notifications.png',
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
