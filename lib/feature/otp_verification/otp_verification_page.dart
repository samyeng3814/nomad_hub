import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:nomad_hub/core/components/custom_clipper.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/constants/constants.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/core/utils/otp_field.dart';
import 'package:nomad_hub/feature/nav_bar/nav_bar.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late Timer timer;
  int start = 0;
  bool isButtonEnabled = false;
  bool isTimerEnabled = false;
  String getEnterdOtp = '';
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            isButtonEnabled = true;
            isTimerEnabled = false;
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -screenHeight * .1,
            right: -screenWidth * .25,
            child: Transform.rotate(
              angle: -pi / 3.5,
              child: ClipPath(
                clipper: ClipPainter(),
                child: Container(
                  height: screenHeight * .5,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.secondaryColor,
                        AppColors.primaryColor,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xfff3f3f4),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          popContext(context);
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: AppColors.blackColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Verification ',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'code',
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: screenHeight * 0.04,
                            ),
                            CustomText(
                              text:
                                  "We have sent the verification code to mobile number",
                              color: AppColors.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            ),
                            AppSizedBox.h40,
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OtpTextField(
                                    getEnterdOtp: (val) {
                                      return getEnterdOtp = val;
                                    },
                                  ),
                                  AppSizedBox.h24,
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      backgroundColor: AppColors.primaryColor,
                                      elevation: 1,
                                      padding: const EdgeInsets.all(18),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (getEnterdOtp.length == 6) {
                                        pushContext(context,
                                            route: const ScreenLayout());
                                      } else {
                                        setState(() {
                                          start = 30;
                                          isButtonEnabled = false;
                                          isTimerEnabled = true;
                                          startTimer();
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      width: screenWidth,
                                      child: const Center(
                                        child: CustomText(
                                          text: 'Verify',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      AppSizedBox.h20,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          isTimerEnabled
                                              ? CustomText(
                                                  text:
                                                      "00:00:${start.toString().length == 1 ? start.toString().padLeft(0, start.toString()) : start.toString()}",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                )
                                              : const CustomText(
                                                  text: '',
                                                  fontSize: 12,
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AppSizedBox.h48,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: "Didn't receive any code?",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      AppSizedBox.w6,
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                        ),
                                        onPressed:
                                            isButtonEnabled && !isTimerEnabled
                                                ? () {
                                                    setState(() {
                                                      start = 30;
                                                      isButtonEnabled = false;
                                                      isTimerEnabled = true;
                                                      startTimer();
                                                    });
                                                  }
                                                : null,
                                        child: const CustomText(
                                          text: 'Resend',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "Need help? ",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    AppSizedBox.w6,
                    InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: 'Contact Support',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}


//////////////////////////[otpField]//////////////////
     // Row(
     //   mainAxisAlignment:
     //       MainAxisAlignment.spaceBetween,
     //   children: [
     //     _otpTextField(
     //       first: true,
     //       controller: contrller1,
     //       last: false,
     //     ),
     //     _otpTextField(
     //       first: false,
     //       controller: contrller2,
     //       last: false,
     //     ),
     //     _otpTextField(
     //       first: false,
     //       controller: contrller3,
     //       last: false,
     //     ),
     //     _otpTextField(
     //       first: false,
     //       controller: contrller4,
     //       last: false,
     //     ),
     //     _otpTextField(
     //       first: false,
     //       controller: contrller5,
     //       last: false,
     //     ),
     //     _otpTextField(
     //       first: false,
     //       controller: contrller6,
     //       last: true,
     //     ),
     //   ],
     // )

  //     Widget _otpTextField({bool? first, last, TextEditingController? controller}) {
  //   return SizedBox(
  //     height: screenHeight * 0.1,
  //     width: screenWidth * 0.1,
  //     child: TextField(
  //       autofocus: first! ? true : false,
  //       controller: controller,
  //       onChanged: (value) {
  //         controller!.selection =
  //             TextSelection.collapsed(offset: controller.text.length);
  //         if (value.length == 1 && last == false) {
  //           FocusScope.of(context).nextFocus();
  //         }
  //         if (value.isEmpty && first == false) {
  //           FocusScope.of(context).previousFocus();
  //         }
  //       },
  //       showCursor: false,
  //       readOnly: false,
  //       textAlign: TextAlign.center,
  //       style: const TextStyle(
  //         fontSize: 16,
  //         fontWeight: FontWeight.w400,
  //       ),
  //       inputFormatters: [
  //         FilteringTextInputFormatter.allow(RegExp("[0-9]")),
  //       ],
  //       keyboardType: TextInputType.number,
  //       maxLength: 1,
  //       decoration: InputDecoration(
  //         counterText: '',
  //         contentPadding: const EdgeInsets.all(14),
  //         disabledBorder: InputBorder.none,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12),
  //           borderSide: BorderSide.none,
  //         ),
  //         fillColor: const Color(0xfff3f3f4),
  //         filled: true,
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12),
  //           borderSide: BorderSide(
  //             color: AppColors.primaryColor,
  //             width: 1,
  //           ),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //       ),
  //     ),
  //   );
  // }
/////////////////////////////////////////////////////////////////////////