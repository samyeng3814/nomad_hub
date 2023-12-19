import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:nomad_hub/core/components/custom_clipper.dart';
import 'package:nomad_hub/core/components/custom_text_field.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/constants/constants.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/core/utils/validator.dart';
import 'package:nomad_hub/feature/login/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  final FocusNode namFocusNode = FocusNode();
  final FocusNode mobileNumberFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<String> gender = ["Male", "Female", "Custom"];
  String selectGender = '';

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // pushContext(context, route: const SignUpPage());
    }
  }

  Widget radioTile(String title) {
    return RadioListTile(toggleable: false,
        contentPadding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        title: Text(title),
        value: title,
        groupValue: selectGender,
        onChanged: (value) {
          setState(() {
            selectGender = value as String;
          });
        });
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
            padding: const EdgeInsets.symmetric(horizontal: 26, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Sign ',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Up',
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
                                      text: "Full Name",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    AppSizedBox.h12,
                                    CustomTextField(
                                      autofocus: true,
                                      obsureText: false,
                                      onFieldSubmitted: (val) {
                                        namFocusNode.requestFocus(mobileNumberFocusNode);
                                      },
                                      controller: nameController,
                                      hintText: "Full name",
                                      focusNode: namFocusNode,
                                      inputFormatter:
                                          TextFieldValidator.nameValidator,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter Full Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                AppSizedBox.h24,
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
                                      controller: mobileNumberController,
                                      hintText: "Mobile Number",
                                      focusNode: mobileNumberFocusNode,
                                      prefix: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                      inputFormatter: TextFieldValidator
                                          .mobileNumberValidator,
                                      validator: (val) {
                                        return TextFieldValidator()
                                            .validateMobile(val!);
                                      },
                                    ),
                                  ],
                                ),
                                AppSizedBox.h24,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: "Gender",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                    AppSizedBox.h12,
                                    Row(
                                     
                                      children: gender
                                          .map((e) =>
                                              Expanded(
                                                child: radioTile(e)))
                                          .toList(),
                                    )
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
                                        text: 'Register',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                AppSizedBox.h32,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Already have an account? ',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.blackColor,
                                    ),
                                    AppSizedBox.w6,
                                    InkWell(
                                      onTap: () {
                                        pushContext(context, route: const LoginScreen());
                                      },
                                      child: CustomText(
                                        text: 'Login',
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
