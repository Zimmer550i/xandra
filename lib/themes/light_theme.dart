import 'package:flutter/material.dart';
import 'package:xandra/utils/app_colors.dart';

ThemeData light() => ThemeData(
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColors.offWhite,
  colorScheme: const ColorScheme.light(
    // primary: AppColors.brandPrimary,
    // onPrimary: Colors.white,
    onSurface: AppColors.textPrimary, // 👈 default text color
  ),
);
