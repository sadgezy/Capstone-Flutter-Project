import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';

class RecentActivitySheet extends StatefulWidget {
  const RecentActivitySheet({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<RecentActivitySheet> createState() => _RecentActivitySheetState();
}

class _RecentActivitySheetState extends State<RecentActivitySheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4, // Initial height of the sheet from the bottom
      minChildSize: 0.4, // Minimum height of the sheet when dragged down
      maxChildSize: 1, // Maximum height of the sheet when dragged up
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 30.0),
                  child: Container(
                    height: 20,
                    child: const Text(
                      'Recent Activities:',
                      style: TextStyle(
                        fontFamily: 'AntipastoPro',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 60,
                        // ),
                        Container(
                          height: widget.screenHeight * 0.3,
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount:
                                3, // Replace with the actual number of recent activities
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  width: widget.screenWidth * 0.85,
                                  // height: 100,
                                  // color: AppColors.secondaryColor,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: index == 0
                                                  ? EdgeInsets.only(top: 50)
                                                  : EdgeInsets.all(0),
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: const BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                              ),
                                              child: Image.asset(
                                                'assets/homescreen/wallet.png',
                                                scale: 3.5,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: index == 0
                                                      ? EdgeInsets.only(top: 50)
                                                      : EdgeInsets.all(0),
                                                  child: const Text(
                                                    'Cash In', //Activity Name
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'AntipastoPro',
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors
                                                          .backgroundColor,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${'You'} added ${'PHP 4,000.00'} to your wallet.', //Activity Name
                                                  style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .backgroundColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ]));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 70,
                    height: 5,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
