import 'package:bill_splitter/colors.dart';
// import 'package:bill_splitter/model/bill_items.dart';
import 'package:bill_splitter/model/split_list.dart';
import 'package:bill_splitter/presentation/screen/home_page/controllers/homepage_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/controllers/splits_controller.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/divide_app_bar.dart';
import 'package:bill_splitter/presentation/screen/split_feature/views/split_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DivideSplitScreen extends StatefulWidget {
  const DivideSplitScreen({super.key});

  @override
  State<DivideSplitScreen> createState() => _DivideSplitScreenState();
}

class _DivideSplitScreenState extends State<DivideSplitScreen> {
  final SplitController splitController = Get.find<SplitController>();
  // Use the controller to get or set the slider value

// splitController.currentSliderValue = newValue; // Set the slider value
  @override
  void initState() {
    super.initState();
    splitController.updateValues();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List arguments = Get.arguments ?? [];
    Split splitList = arguments.isNotEmpty && arguments[0] != null
        ? arguments[0]
        : Split(
            billItems: [],
            selectedContacts: [],
            splitTitle: '',
            dueDate: '',
            splitTotal: 0.0,
          );
    return ColoredBox(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: DivideAppBar(screenSize: screenSize),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SplitTitle(splitcontroller: splitController, screenSize: screenSize),
                Container(
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  width: screenSize.width,
                  // height: screenSize.height * 0.8,
                  color: AppColors.backgroundColor,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(16.0),
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.71,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: screenSize.height * 0.1,
                                width: screenSize.width * 0.9,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: screenSize.width * 0.9,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.receipt_long_sharp,
                                              color: AppColors.accentColor,
                                              size: 50,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 16.0),
                                              child: Text(
                                                'Total:',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.accentColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 16.0),
                                          height: screenSize.height * 0.45,
                                          width: screenSize.width * 0.40,
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryColor,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'PHP ${splitList.splitTotal}', //Total Bil Cost
                                              style: const TextStyle(
                                                fontFamily: 'QuickSand',
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.accentColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const CustomDivider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      'Split Equally',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.accentColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Obx(() {
                                        return Checkbox(
                                          value: splitController.isEvenSplit.value,
                                          onChanged: (bool? value) {
                                            splitController.toggleEvenSplit();

                                            if (splitController.isEvenSplit.value) {
                                              // If the checkbox is checked, split the sliders evenly
                                              splitController.splitValueEqually(
                                                  splitList.splitTotal,
                                                  splitList.selectedContacts.length);
                                            } else {
                                              // If the checkbox is not checked, reset the sliders to 0
                                              splitController
                                                  .updateValues(); // Ensure sliderValues has the correct length
                                              splitController.sliderValues.fillRange(0,
                                                  splitList.selectedContacts.length, 0);
                                            }
                                          },
                                          activeColor: AppColors.accentColor,
                                        );
                                      })),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Container(
                                  width: screenSize.width * 0.9,
                                  height: screenSize.height * 0.45,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Obx(() {
                                    return ListView.builder(
                                        itemCount: splitList.selectedContacts.length,
                                        itemBuilder: (context, index) {
                                          // print(
                                          //     'Selected contacts1: ${splitList.getSelectedContacts()}');
                                          return Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          AppColors.accentColor,
                                                      radius: 15,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                            color: AppColors
                                                                .accentColor, // Change the color as needed
                                                            width:
                                                                2.0, // Change the width as needed
                                                          ),
                                                        ),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              AppColors.accentColor,
                                                          backgroundImage: NetworkImage(
                                                            'https://source.unsplash.com/random?sig=$index',
                                                          ), // Replace with image path
                                                          radius: 25,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(left: 16.0),
                                                      child: Text(
                                                        '${splitList.selectedContacts[index].contact.displayName}',
                                                        style: TextStyle(
                                                          fontFamily: 'Quicksand',
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w900,
                                                          color: AppColors.accentColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      height: 40,
                                                      width: screenSize.width * 0.25,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.accentColor,
                                                        borderRadius:
                                                            BorderRadius.circular(20),
                                                      ),
                                                      child: Center(
                                                        child: Obx(() {
                                                          if (index <
                                                              splitController
                                                                  .splitValueControllers
                                                                  .length) {
                                                            return Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets.all(
                                                                        8.0),
                                                                child: TextField(
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Quicksand',
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                        FontWeight.w700,
                                                                    color: AppColors
                                                                        .secondaryColor,
                                                                  ),
                                                                  controller: splitController
                                                                          .splitValueControllers[
                                                                      index],
                                                                  onSubmitted:
                                                                      (newValue) {
                                                                    double?
                                                                        newSliderValue =
                                                                        double.tryParse(
                                                                            newValue);
                                                                    if (newSliderValue !=
                                                                        null) {
                                                                      splitController
                                                                          .updateSliderValue(
                                                                              index,
                                                                              newSliderValue);
                                                                    }
                                                                  },
                                                                  // ...
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Container(); // return an empty container if the index is invalid
                                                          }
                                                        }),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      // width: screenSize.width * 0.55
                                                      // height: screenSize.height * 0.05,
                                                      child: SliderTheme(
                                                          data: SliderTheme.of(context)
                                                              .copyWith(
                                                            activeTrackColor:
                                                                AppColors.accentColor,
                                                            inactiveTrackColor: AppColors
                                                                .accentColor
                                                                .withOpacity(0.5),
                                                            trackHeight: 15.0,
                                                            thumbColor:
                                                                AppColors.accentColor,
                                                            thumbShape:
                                                                RoundSliderThumbShape(
                                                                    enabledThumbRadius:
                                                                        12.0),
                                                            overlayColor: AppColors
                                                                .accentColor
                                                                .withAlpha(32),
                                                            overlayShape:
                                                                RoundSliderOverlayShape(
                                                                    overlayRadius: 30.0),
                                                          ),
                                                          child: Obx(() {
                                                            if (index <
                                                                splitController
                                                                    .sliderValues
                                                                    .length) {
                                                              return Slider(
                                                                value: splitController
                                                                    .sliderValues[index],
                                                                min: 0,
                                                                max: splitList.splitTotal,
                                                                label: splitController
                                                                    .currentSliderValue
                                                                    .round()
                                                                    .toString(),
                                                                onChanged:
                                                                    (double newValue) {
                                                                  if (splitController
                                                                      .isEvenSplit
                                                                      .value) {
                                                                    splitController.splitValueEqually(
                                                                        splitList
                                                                            .splitTotal,
                                                                        splitController
                                                                            .sliderValues
                                                                            .length);
                                                                  } else {
                                                                    splitController
                                                                        .updateSliderValue(
                                                                            index,
                                                                            newValue);
                                                                  }
                                                                },
                                                                // ...
                                                              );
                                                            } else {
                                                              return Container(); // return an empty container if the list is empty or the index is invalid
                                                            }
                                                          })),
                                                    ),
                                                  ],
                                                ),
                                                CustomDivider()
                                              ],
                                            ),
                                          );
                                        });
                                  }),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    backgroundColor: AppColors.accentColor,
                                    padding:
                                        EdgeInsets.all(10), // The color of the button
                                  ),
                                  child: Icon(Icons.check, size: 40), // The check icon
                                  onPressed: () {
                                    // Get the instance of HomePageController
                                    HomePageController homePageController = Get.find();
                                    // Print the data inside splitList
                                    // print('SplitList contents: $splitList');

                                    // Add the new Split to the list in HomePageController
                                    homePageController.addSplit(splitList);

                                    Get.toNamed('/home');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        height: 1.0, // Set the thickness of your divider
        child: const FractionallySizedBox(
          widthFactor: 1.3, // Set the width of your divider
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.white,
                  Colors.transparent,
                ],
                stops: [0.1, 0.5, 0.9],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
