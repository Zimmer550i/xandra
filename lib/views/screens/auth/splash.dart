import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/screens/auth/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  onTap() async {
    Get.to(() => Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        CustomSvg(asset: "assets/icons/logo.svg"),
                        CustomSvg(
                          asset: "assets/icons/logo_name.svg",
                          color: Get.find<ThemeController>().darkTheme
                              ? Colors.white
                              : null,
                        ),
                      ],
                    )
                    .animate(delay: Duration(milliseconds: 200))
                    .slideY(
                      begin: -20,
                      end: 0,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 1000),
                    ),
                Text(
                      "Discover. Try. Buy — with\nconfidence.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    )
                    .animate(delay: Duration(milliseconds: 1000))
                    .fadeIn(duration: Duration(milliseconds: 300))
                    .slideY(
                      begin: 5,
                      end: 0,
                      duration: Duration(milliseconds: 500),
                    ),
              ],
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 8 + MediaQuery.of(context).viewPadding.bottom,
            child: CustomButton(onTap: onTap, text: "Next")
                .animate(delay: Duration(milliseconds: 1100))
                .fadeIn(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                ),
          ),

          Positioned(
            top: -MediaQuery.of(context).size.width / 1.5,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 1.2,
                decoration: BoxDecoration(
                  color: AppColors.brandPrimary.withValues(alpha: .20),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: IgnorePointer(
              child: ColoredBox(color: AppColors.brandPrimary)
                  .animate()
                  .fadeOut(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
