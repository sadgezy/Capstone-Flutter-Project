import 'package:bill_splitter/colors.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_app_bar.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_drawer.dart';
import 'package:bill_splitter/presentation/screen/home_page/views/home_pill.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      appBar: HomeAppBar(
        screenSize: MediaQuery.of(context).size,
        backgroundColor: AppColors.accentColor,
      ),
      drawer: HomeDrawer(),
      body: Column(children: [
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
        )
      ]),
    );
  }
}

class circlesPage extends StatelessWidget {
  const circlesPage({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.85,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick access: ',
            style: TextStyle(
              fontFamily: 'AntipastoPro',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.backgroundColor,
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Distribute the circles evenly across the Row
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  // backgroundImage: NetworkImage(
                  //   'https://source.unsplash.com/random?sig=1',
                  // ), // Replace with image path
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  // backgroundImage: NetworkImage(
                  //   'https://source.unsplash.com/random?sig=1',
                  // ), // Replace with image path
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  // backgroundImage: NetworkImage(
                  //   'https://source.unsplash.com/random?sig=1',
                  // ), // Replace with image path
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  // backgroundImage: NetworkImage(
                  //   'https://source.unsplash.com/random?sig=1',
                  // ), // Replace with image path
                  radius: 30,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  // backgroundImage: NetworkImage(
                  //   'https://source.unsplash.com/random?sig=1',
                  // ), // Replace with image path
                  radius: 30,
                  child: Center(
                    child: Text(
                      '···',
                      style: TextStyle(
                        fontFamily: 'AntipastoPro',
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
                height: 45,
                width: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/homescreen/users.png',
                        scale: 3.5,
                        color: AppColors.primaryColor,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'new',
                          style: TextStyle(
                            fontFamily: 'AntipastoPro',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class SplitsPage extends StatefulWidget {
  const SplitsPage({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SplitsPage> createState() => _SplitsPageState();
}

class _SplitsPageState extends State<SplitsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth * 0.85,
      padding: EdgeInsets.all(20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  'Total owed: ',
                  style: TextStyle(
                    fontFamily: 'AntipastoPro',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.backgroundColor,
                  ),
                ),
                BalanceRow(),
                const Row(
                  children: [
                    Text(
                      'Your balance: ',
                      style: TextStyle(
                        fontFamily: 'AntipastoPro',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                    Text('PHP 1000.00',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.backgroundColor,
                        )),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: widget.screenWidth * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 45,
                              width: widget.screenWidth * 0.25,
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/homescreen/create_order.png',
                                      scale: 3.5,
                                      color: AppColors.primaryColor,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'create',
                                        style: TextStyle(
                                          fontFamily: 'AntipastoPro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              height: 45,
                              width: widget.screenWidth * 0.21,
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/homescreen/coin_in_hand.png',
                                      scale: 3.5,
                                      color: AppColors.primaryColor,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'pay',
                                        style: TextStyle(
                                          fontFamily: 'AntipastoPro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              height: 45,
                              width: widget.screenWidth * 0.25,
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/homescreen/wallet.png',
                                      scale: 3.5,
                                      color: AppColors.primaryColor,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'wallet',
                                        style: TextStyle(
                                          fontFamily: 'AntipastoPro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                  ),
                )
              ])
            ],
          )
        ],
      ),
    );
  }
}

class BalanceRow extends StatefulWidget {
  const BalanceRow({
    super.key,
  });

  @override
  State<BalanceRow> createState() => _BalanceRowState();
}

class _BalanceRowState extends State<BalanceRow> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          'PHP ',
          style: TextStyle(
            fontFamily: 'AntipastoPro',
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: AppColors.backgroundColor,
          ),
        ),
        Text(
          isHidden ? '∘∘∘∘∘' : '3456.78',
          style: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: AppColors.backgroundColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
                size: 30,
                color: AppColors.accentColor,
                isHidden ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
          ),
        ),
      ],
    );
  }
}
