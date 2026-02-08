import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/screens/onboarding/scan_your_face.dart';

class StartJourney extends StatelessWidget {
  const StartJourney({super.key});

  onSubmit() {
    Get.to(() => ScanYourFace());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/onboarding_01.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20 + MediaQuery.of(context).viewPadding.bottom,
            child:
                LiquidGlassLayer(
                  settings: LiquidGlassSettings(
                    visibility: 1.0,
                    glassColor: Get.find<ThemeController>().darkTheme
                        ? Color(0xff_0d0d0d).withValues(alpha: 0.1)
                        : Colors.white.withValues(alpha: 0.1),
                    thickness: 20,
                    blur: 5,
                    chromaticAberration: 0.01,
                    lightAngle: 0.5 * pi,
                    lightIntensity: 0.5,
                    ambientStrength: 0,
                    refractiveIndex: 1.51,
                    saturation: 1,
                  ),
                  child: LiquidGlass(
                    shape: LiquidRoundedSuperellipse(borderRadius: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 20,
                        children: [
                          Text(
                            "Your Personal\nSkincare Companion",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              height: 1.5,
                              color: Get.find<ThemeController>().darkTheme
                                  ? AppColors.darkCard
                                  : AppColors.offWhite,
                            ),
                          ),
                          GestureDetector(
                            onTap: onSubmit,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: Get.find<ThemeController>().darkTheme
                                    ? AppColors.darkCard
                                    : AppColors.offWhite,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Start My Journey",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Get.find<ThemeController>().darkTheme
                                          ? AppColors.softBeige
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color:
                                          Get.find<ThemeController>().darkTheme
                                          ? AppColors.brandPrimary
                                          : AppColors.brandSecondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: CustomSvg(
                                        asset: "assets/icons/arrow_right.svg",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animate().slideX(
                  begin: 5,
                  end: 0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
          ),
        ],
      ),
    );
  }
}
