import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/profile_picture.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:xandra/views/screens/onboarding/profile_created.dart';

class Analyzing extends StatelessWidget {
  const Analyzing({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove this with actual Logic
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => Future.delayed(
        Duration(seconds: 3),
        () => Get.to(() => ProfileCreated()),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Rotate these two elements
                  CustomSvg(asset: "assets/icons/analyzing_1.svg")
                      .animate(onPlay: (controller) => controller.repeat())
                      .rotate(duration: Duration(seconds: 4)),
                  CustomSvg(asset: "assets/icons/analyzing_2.svg")
                      .animate(onPlay: (controller) => controller.repeat())
                      .rotate(
                        duration: Duration(seconds: 6),
                        begin: 0,
                        end: -1,
                      ),
                  ProfilePicture(
                    size: 125,
                    image: "http://thispersondoesnotexist.com",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Analyzing...",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Al is creating your personalized beauty profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  value: .5,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(99),
                  backgroundColor: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_380018)
                      : AppColors.brandSecondary,
                  color: AppColors.brandPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "50%",
                style: TextStyle(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 46),
              Column(
                spacing: 12,
                children: [
                  for (var i in [
                    "Al-powered shade matching",
                    "Personalized product recommendations",
                    "Virtual try-on with your skin tone",
                    "Compatibility scores for every product",
                  ])
                    Opacity(
                      opacity:
                          [
                            "Virtual try-on with your skin tone",
                            "Compatibility scores for every product",
                          ].contains(i)
                          ? 0.4
                          : 1,
                      child: Row(
                        spacing: 8,
                        children: [
                          CustomSvg(
                            asset:
                                "assets/icons/point${Get.find<ThemeController>().darkTheme ? "_dark" : ""}.svg",
                          ),
                          Text(
                            i,
                            style: TextStyle(
                              color: Get.find<ThemeController>().darkTheme
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
