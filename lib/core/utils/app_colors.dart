import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color primaryColor = const Color(0XFF1A4CfB);
  static Color secondaryColor = const Color(0XFF749AFD);
  static Color darkBlueBlack = const Color(0XFF263A52);
  static Color redButtonColor = const Color(0XFFEE5547);
  static Color redButtonLightColor = const Color(0XFFFDEEEC);
  static Color lightBlueColor = const Color(0XFFA3CAE9);
  static Color logoContainer = const Color(0xFFe9eff3);
  static LinearGradient heliotropeTintGradient = const LinearGradient(
    stops: [0, 0.62],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xFFD1FDFE),
      Color(0xFF5EE9FD),
    ],
  );
  static LinearGradient blueGreenGradient = const LinearGradient(
    stops: [0, 0.82],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0x7300C8A2),
      Color(0xFF0074E4),
    ],
  );
  static LinearGradient buttonGradient = const LinearGradient(
    colors: <Color>[
      Color(0XFF1A4CfB),
      Color(0xFF1976D2),
      Color(0xFF42A5F5),
    ],
  );
  static Color salaryIcon = const Color(0XFF33CEF4);
  static Color salaryContainer = const Color(0XFFCEF5DF);
  static Color jobTypeIcon = const Color(0xFFfc5c5c);
  static Color jobTypeContainer = const Color(0xFFfaecf3);
  static Color calenderContainer = const Color(0xFFe7e5fd);
  static Color calenderIcon = const Color(0xFF3f3bed);
  static Color appliedContainer = const Color(0XFFF1F5F9);
  static Color appliedText = const Color(0XFF475569);
  static Color approvedContainer = const Color(0XFFCEF5DF);
  static Color approvedText = const Color(0XFF047857);
  static Color pendingContainer = const Color(0XFFE0EFFF);
  static Color pendingText = const Color(0XFF0063D6);
  static Color expiredContainer = const Color(0XFFFEECBE);
  static Color expiredText = const Color(0XFFB45309);
  static Color cancelledContainer = const Color(0XFFFEF2F2);
  static Color cancelledText = const Color(0XFFB91C1C);
}
