import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/screens/profile/edit_information.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Account Information"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : AppColors.borderDivider,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "John Doe",
                                style: TextStyle(
                                  color: Get.find<ThemeController>().darkTheme
                                      ? AppColors.darkTextSecondary
                                      : AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => EditInformation());
                          },
                          child: Row(
                            spacing: 4,
                            children: [
                              CustomSvg(
                                asset: "assets/icons/edit.svg",
                                size: 14,
                                color: AppColors.textPrimary,
                              ),
                              Text("Edit"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    seperator(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "wasiul0491@gmail.com",
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
                    seperator(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Last modified 1 month ago",
                                style: TextStyle(
                                  color: Get.find<ThemeController>().darkTheme
                                      ? AppColors.darkTextSecondary
                                      : AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            spacing: 4,
                            children: [
                              CustomSvg(
                                asset: "assets/icons/edit.svg",
                                size: 14,
                                color: AppColors.textPrimary,
                              ),
                              Text("Edit"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  seperator() {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      height: 1,
      width: double.infinity,
      color: Color(0xff_F4ECE9),
    );
  }
}
