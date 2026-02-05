import 'package:flutter/material.dart';
import 'package:xandra/utils/app_colors.dart';

ThemeData dark() => ThemeData(
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColors.darkBackground,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.brandPrimary,
    onPrimary: Colors.white,
    onSurface: Color(0xff_e1e1e3), // 👈 default text color
  ),
);
