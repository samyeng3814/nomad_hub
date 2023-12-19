import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';

Column jobDescCommonWidget(
    {required Color iconColor,
    required Color containerColor,
    required IconData icon,
    required String title,
    required String type}) {
  return Column(
    children: [
      Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
          )),
      AppSizedBox.h6,
      CustomText(
        text: title,
        fontSize: 12,
      ),
      AppSizedBox.h6,
      CustomText(
        text: type,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ],
  );
}
