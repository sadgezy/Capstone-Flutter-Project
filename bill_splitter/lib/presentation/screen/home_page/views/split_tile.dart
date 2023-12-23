import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/model/split_list.dart';
import 'package:bill_splitter/presentation/screen/home_page/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplitCard extends StatefulWidget {
  SplitCard({
    Key? key,
    required this.split,
    required this.index,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;
  final Split split;
  final int index;

  @override
  State<SplitCard> createState() => _SplitCardState();
}

class _SplitCardState extends State<SplitCard> {
  HomePageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.screenWidth * 0.60,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.antiAlias,
          children: [
            const Positioned(
                top: 80,
                left: -20,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.white,
                )),
            const Positioned(
                top: 80,
                left: 235,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.white,
                )),
            Positioned(
              top: 15,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.splits[widget.index].title,
                    style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accentColor,
                    ),
                  ),
                  const SizedBox(height: 6), // Add some spacing
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 60, // Adjust as needed
                        width: widget.screenWidth * 0.35,
                        child: Stack(
                          children: List.generate(3, (index) {
                            return Positioned(
                              left: index * 20.0, // Adjust as needed
                              child: CircleAvatar(
                                backgroundColor: AppColors.accentColor,
                                radius: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors
                                          .accentColor, // Change the color as needed
                                      width: 2.0, // Change the width as needed
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.accentColor,
                                    backgroundImage: NetworkImage(
                                      'https://source.unsplash.com/random?sig=${index}',
                                    ), // Replace with image path
                                    radius: 25,
                                  ),
                                ),
                              ),
                            );
                          }).reversed.toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Obx(
                          () {
                            return Text(
                              'Total: PHP ${controller.splits[widget.index].splitTotal.toString()}',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 9.5,
                                fontWeight: FontWeight.w300,
                                color: AppColors.accentColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      width: widget.screenWidth * 0.51,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Your Split',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              controller.getDueDate(widget.index),
                              style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
