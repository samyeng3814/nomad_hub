import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nomad_hub/core/constants/constants.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';

class OtpTextField extends StatefulWidget {
  final Function(String) getEnterdOtp;
  const OtpTextField({super.key,required this.getEnterdOtp});
  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  List<FocusNode>? focusNodes;
  List<TextEditingController>? controllers;
  int pinLength = 6;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(pinLength, (index) => FocusNode());
    controllers = List.generate(pinLength, (index) => TextEditingController());

    // for (int i = 0; i < pinLength; i++) {
    //   controllers![i].addListener(() {
    //   if (i > 0) {
    //     focusNodes![i - 1].requestFocus();
    //   }
    //   });
    // }
  }

  @override
  void dispose() {
    for (var controller in controllers!) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        pinLength,
        (index) => SizedBox(
          height: screenHeight * 0.1,
          width: screenWidth * 0.1,
          child: TextField(
            enableInteractiveSelection: false,
            autofocus: index == 0 ? true : false,
            focusNode: focusNodes![index],
            controller: controllers![index],
            onChanged: (value) {
             
              if (value.isEmpty && index > 0) {
                focusNodes![index - 1].requestFocus();
              } else if (value.isNotEmpty && index != pinLength - 1) {
                focusNodes![index + 1].requestFocus();
              }
              String enteredOtp = otpValue();
              widget.getEnterdOtp(enteredOtp);
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.all(14),
              disabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color(0xfff3f3f4),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String  otpValue(){
    return controllers!.map((e) => e.text).join();
  }
}
