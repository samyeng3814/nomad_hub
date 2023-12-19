import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad_hub/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obsureText;
  final int maxLines;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final bool? isBorderEnabled; 
  final bool? autofocus;
  final Function(String)? onFieldSubmitted;
  final bool isLabelEnabled;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.obsureText = false,
    this.maxLines = 1,
    this.prefix,
    this.validator,
    this.inputFormatter,
    this.focusNode,
    this.isBorderEnabled =false,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.isLabelEnabled =false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        style: const TextStyle(
       fontSize: 14,
        ),
        obscureText: obsureText!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: autofocus!,
        focusNode: focusNode,
        controller: controller,
        cursorColor: AppColors.lightBlueColor,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatter,
         textAlignVertical: TextAlignVertical.center, 
        decoration: InputDecoration(
          prefixIcon: prefix,
            contentPadding:const EdgeInsets.symmetric(horizontal: 10),
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          fillColor: const Color(0xfff3f3f4),
          filled: true,
          labelText: isLabelEnabled? hintText:null ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.blueGrey.shade200),
          enabledBorder: OutlineInputBorder(
            borderSide:isBorderEnabled!? BorderSide(color: AppColors.redButtonColor.withOpacity(0.5),
              width: 1,): BorderSide.none,
            borderRadius: BorderRadius.circular(12),
            
          ),
        ),
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }
}
