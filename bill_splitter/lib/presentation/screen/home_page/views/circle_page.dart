import 'package:bill_splitter/colors.dart';
import 'package:flutter/material.dart';

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
