import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/models/cliclable_object.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/profile_picture.dart';
import 'package:xandra/views/screens/profile/dashboard.dart';
import 'package:xandra/views/screens/profile/order_history.dart';
import 'package:xandra/views/screens/profile/saved.dart';
import 'package:xandra/views/screens/profile/saved_videos.dart';
import 'package:xandra/views/screens/profile/settings.dart';
import 'package:xandra/views/screens/profile/withdraw.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<CliclableObject> menuOptions = [
    CliclableObject(
      title: "Saved Looks & Products",
      assetName: "heart",
      page: Saved(),
    ),
    CliclableObject(
      title: "Dashboard",
      assetName: "dashboard",
      page: Dashboard(),
    ),
    CliclableObject(
      title: "Order History",
      assetName: "history",
      page: OrderHistory(),
    ),
    CliclableObject(title: "Withdraw", assetName: "withdraw", page: Withdraw()),
    CliclableObject(
      title: "Saved Videos",
      assetName: "save",
      page: SavedVideos(),
    ),
    CliclableObject(title: "Settings", assetName: "settings", page: Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile", hasLeading: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  ProfilePicture(
                    image: "https://thispersondoesnotexist.com",
                    size: 68,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name Here",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
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
                ],
              ),
              const SizedBox(height: 16),
              beautyProfile(),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : AppColors.borderDivider,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16,
                      ),
                      child: Container(height: 1, color: Color(0xff_f5f5f5)),
                    );
                  },
                  itemCount: menuOptions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final item = menuOptions.elementAt(i);
                    return GestureDetector(
                      onTap: () {
                        if (item.page != null) {
                          Get.to(() => item.page!);
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xff_F6E4EB)),
                            ),
                            child: Center(
                              child: CustomSvg(
                                asset: "assets/icons/${item.assetName}.svg",
                                color: Get.find<ThemeController>().darkTheme
                                    ? Color(0xff_380018)
                                    : AppColors.brandSecondary,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.title,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          CustomSvg(asset: "assets/icons/arrow_forward.svg"),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 73 + 7),
            ],
          ),
        ),
      ),
    );
  }

  Container beautyProfile() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Get.find<ThemeController>().darkTheme
            ? Color(0xFF2F2F2F)
            : Color(0xFFFFEAF1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkCard
                      : AppColors.offWhite,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomSvg(asset: "assets/icons/beauty.svg", size: 29),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Beauty Profile",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    "Al-powered personalization",
                    textAlign: TextAlign.center,
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
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkCard
                        : AppColors.offWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        "Skin Tone",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD4B896),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkCard
                        : AppColors.offWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        "Undertone",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFC400),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
