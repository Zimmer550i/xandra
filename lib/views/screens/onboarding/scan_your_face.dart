import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/screens/onboarding/analyzing.dart';

class ScanYourFace extends StatelessWidget {
  const ScanYourFace({super.key});

  onSubmit() async {
    Get.to(() => Analyzing());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/scanner.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    bottom: false,
                    child: Center(
                      child: Text(
                        "Position your face within the frame",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkCard
                          : AppColors.cardBackground,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(16, 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              color: Get.find<ThemeController>().darkTheme
                  ? AppColors.darkCard
                  : AppColors.cardBackground,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Text(
                    "Scan Your Face",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Our Al will analyze your skin tone and undertone for perfect shade matching",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: onSubmit,
                    text: "Take Photo",
                    leading: "assets/icons/edit.svg",
                  ),
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () {
                      // TODO: Add goto App route
                    },
                    child: Text(
                      "Skip for now",
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
