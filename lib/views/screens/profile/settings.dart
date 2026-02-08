import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/models/cliclable_object.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/overlay_confirmation.dart';
import 'package:xandra/views/screens/auth/splash.dart';
import 'package:xandra/views/screens/profile/account_information.dart';
import 'package:xandra/views/screens/profile/info.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<CliclableObject> menuOptions = [
    CliclableObject(
      title: "Account Information",
      assetName: "edit",
      page: AccountInformation(),
    ),
    CliclableObject(
      title: "Terms & Conditions",
      assetName: "terms",
      page: Info(
        title: "Terms & Conditions",
        endpoint: "API endpoint for fetching data",
      ),
    ),
    CliclableObject(title: "Logout", assetName: "logout", callBack: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_0D0D0D)
                      : AppColors.cardBackground,
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
                          // Don't know why it doesn't work
                          // Get.to(() => item.page!);
                          Navigator.of(
                            context,
                          ).push(MaterialPageRoute(builder: (_) => item.page!));
                        }
                        if (item.callBack != null) {
                          // Logout
                          showDialog(
                            context: context,
                            builder: (context) {
                              return OverlayConfirmation(
                                title: "Are you sure you want to",
                                highlight: "Logout?",
                                buttonTextLeft: "Cancel",
                                buttonCallBackLeft: () => Get.back(),
                                buttonTextRight: "Logout",
                                buttonCallBackRight: () =>
                                    Get.offAll(() => Splash()),
                              );
                            },
                          );
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
            ],
          ),
        ),
      ),
    );
  }
}
