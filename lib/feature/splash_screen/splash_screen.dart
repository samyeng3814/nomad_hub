import 'package:flutter/material.dart';
import 'package:nomad_hub/core/constants/constants.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/feature/on_boarding_screen/on_boarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigatePage();
    super.initState();
  }

  navigatePage() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: AppColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 54,
                child: Image.asset(
                  "assets/images/sbox_logo.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
