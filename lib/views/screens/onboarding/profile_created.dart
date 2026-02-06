import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/screens/app.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/profile_picture.dart';

class ProfileCreated extends StatelessWidget {
  const ProfileCreated({super.key});

  onSubmit() async {
    Get.to(() => App(), routeName: "/app");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ProfilePicture(
                image: "https://thispersondoesnotexist.com",
                size: 100,
              ),
              const SizedBox(height: 16),
              Text(
                "Profile Created!",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                "Your beauty profile is ready for personalized recommendations",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_2F2F2F)
                      : Color(0xff_FFEAF1),
                ),
                child: Column(
                  children: [
                    Text(
                      "YOUR BEAUTY PROFILE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Skin Tone",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Get.find<ThemeController>().darkTheme
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff_D4B896),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Medium",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Undertone",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Get.find<ThemeController>().darkTheme
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff_FFC400),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Warm",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Color(0xff_b8b8bd).withValues(alpha: 0.2),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "Products will now show compatibility scores based on your unique skin profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("What you will get:"),
              ),
              const SizedBox(height: 16),
              Column(
                spacing: 12,
                children: [
                  for (var i in [
                    "Al-powered shade matching",
                    "Personalized product recommendations",
                    "Virtual try-on with your skin tone",
                    "Compatibility scores for every product",
                  ])
                    Row(
                      spacing: 8,
                      children: [
                        CustomSvg(asset: "assets/icons/point.svg"),
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
                ],
              ),

              const SizedBox(height: 32),
              CustomButton(text: "Start Exploring", onTap: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
