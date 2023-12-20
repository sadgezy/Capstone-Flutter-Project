import 'package:bill_splitter/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/new_split');
                            },
                            child: Container(
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
                          ),
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
