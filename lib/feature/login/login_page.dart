// ignore_for_file: avoid_function_literals_in_foreach_calls, library_private_types_in_public_api

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/constants/constants.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/core/utils/validator.dart';
import 'package:nomad_hub/core/components/custom_clipper.dart';
import 'package:nomad_hub/feature/otp_verification/otp_verification_page.dart';
import 'package:nomad_hub/feature/sign_up/sign_up_page.dart';
import '../../core/components/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    // if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pushContext(context, route: const OtpVerificationPage());
    // }
  }

  showStatusSnackBar(String statusMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        backgroundColor: AppColors.blackColor,
        content: CustomText(
          fontWeight: FontWeight.w400,
          text: statusMsg,
          fontSize: 16,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                    padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Nomad ',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Hub',
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: "Mobile Number",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    AppSizedBox.h12,
                                    CustomTextField(
                                      obsureText: false,
                                      autofocus: true,
                                      controller: mobileNumberController,
                                      hintText: "Mobile Number",
                                      prefix: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 12),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                            child: const CustomText(
                                              text: "+91",
                                            ),
                                          ),
                                        ],
                                      ),
                                      inputFormatter:
                                          TextFieldValidator.mobileNumberValidator,
                                      validator: (val) {
                                        return TextFieldValidator()
                                            .validateMobile(val!);
                                      },
                                    ),
                                  ],
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
                                    _onSubmit();
                                  },
                                  child: SizedBox(
                                    width: screenWidth,
                                    child: const Center(
                                      child: CustomText(
                                        text: 'Get OTP',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                AppSizedBox.h56,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     const CustomText(
                                        text: 'Create new account',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black,
                                      
                                    ),
                                    AppSizedBox.w6,
                                    InkWell(
                                      onTap: () {
                                        pushContext(context, route: const SignUpPage());
                                      },
                                      child: CustomText(
                                        text: 'Sign Up',
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
   
    );
  }
}
