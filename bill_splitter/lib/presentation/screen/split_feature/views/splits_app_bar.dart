import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final _splitController = Get.find<SplitController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: AppColors.primaryColor,
                        content:
                            const Text('Do you want to discard unsaved split?',
                                style: TextStyle(
                                  fontFamily: 'AntipastoPro',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.backgroundColor,
                                )),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'AntipastoPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.accentColor,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Discard',
                              style: TextStyle(
                                fontFamily: 'AntipastoPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.accentColor,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                              // Clear split title and date
                              _splitController.splitTitleController.clear();
                              _splitController.dueDateController.clear();

                              // Clear all controllers
                              _splitController.selectedContacts.clear();
                              _splitController.itemTitleControllers
                                  .forEach((controller) {
                                controller.clear();
                              });
                              _splitController.itemPriceControllers
                                  .forEach((controller) {
                                controller.clear();
                              });

                              // Reset the ListView
                              _splitController.splitItems.clear();
                              Get.back();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_back_ios_new_outlined,
                        color: AppColors.primaryColor)),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
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
              const Padding(
                  padding: EdgeInsets.all(16),
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
