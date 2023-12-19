import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/constants/constants.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/feature/login/login_page.dart';
import 'package:nomad_hub/feature/sign_up/sign_up_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenHeight * 0.4,
              width: 0.4,
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                color: AppColors.primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/welcome_image.svg", fit: BoxFit.fitWidth,
                    height: screenHeight * 0.4,
                    // width: double.infinity,
                  ),
                  AppSizedBox.h32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: "Discover Your Dream Job here",
                          color: AppColors.primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                        ),
                        AppSizedBox.h20,
                        CustomText(
                          text:
                              "Explore all the existing jobs based on your interest around you",
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                        AppSizedBox.h32,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  elevation: 4,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  pushContext(context, route: const LoginScreen());
                                },
                                child: CustomText(
                                  text: "Login",
                                  fontSize: 14,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            AppSizedBox.w12,
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                   pushContext(context, route: const SignUpPage());
                                },
                                child: CustomText(
                                  text: "Register",
                                  fontSize: 14,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
