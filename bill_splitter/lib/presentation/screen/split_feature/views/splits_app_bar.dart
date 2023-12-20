import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplitAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Size screenSize;
  final Color backgroundColor;
  const SplitAppBar(
      {super.key,
      required this.screenSize,
      this.backgroundColor = const Color.fromRGBO(254, 254, 255, 1)});

  @override
  Size get preferredSize =>
      Size(screenSize.width, 90.0); // You can adjust the height as needed.

  @override
  State<SplitAppBar> createState() => _SplitAppBarState();
}

class _SplitAppBarState extends State<SplitAppBar> {
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
                    child: Icon(Icons.arrow_back_ios_new_outlined,
                        color: AppColors.primaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'splits', //Activity Name
                  style: TextStyle(
                    fontFamily: 'AntipastoPro',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 24,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
