import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/bottom_sheet.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/circle_page.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_app_bar.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_drawer.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_pill.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/split_tile.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/splits_page.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ColoredBox(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: HomeAppBar(
            screenSize: MediaQuery.of(context).size,
            backgroundColor: AppColors.accentColor,
          ),
          drawer: HomeDrawer(),
          body: Stack(children: [
            Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                // color: AppColors.primaryColor,
                child: const Padding(
                  padding: EdgeInsets.only(top: 40, left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back, ',
                            style: TextStyle(
                              fontFamily: 'AntipastoPro',
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            'Jessica ',
                            style: TextStyle(
                              fontFamily: 'AntipastoPro',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              HomePill(
                pageController: _pageController,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 12),
                height: 190,
                width: screenWidth * 0.85,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {},
                  controller: _pageController,
                  children: [
                    SplitsPage(screenWidth: screenWidth),
                    circlesPage(screenWidth: screenWidth),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Text(
                    'Active Splits >',
                    style: TextStyle(
                      fontFamily: 'AntipastoPro',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 160,
                width: screenWidth * 0.85,
                child: ScrollSnapList(
                  onItemFocus: (item) {}, // Optional
                  itemSize: (screenWidth * 0.6) + 12.0, // Adjust as needed
                  itemCount: 10, // Replace with the actual number of SplitCards
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SplitCard(screenWidth: screenWidth),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
            Positioned(
              bottom: 0,
              child: Container(
                clipBehavior: Clip.none,
                height: screenHeight * 0.35,
                width: screenWidth,
                // color: AppColors.primaryColor,
                child: RecentActivitySheet(
                    screenHeight: screenHeight, screenWidth: screenWidth),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
