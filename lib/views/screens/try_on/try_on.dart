import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/app_icons.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_color_picker.dart';
import 'package:xandra/views/base/custom_tabs.dart';

// findProduct = from homescreen trying to find product
// tryOnProduct = from productDetails
// saved = from saved
enum TryOnType { findProduct, tryOnProduct, saved }

class TryOn extends StatefulWidget {
  final TryOnType tryOnType;
  const TryOn({super.key, this.tryOnType = TryOnType.tryOnProduct});

  @override
  State<TryOn> createState() => _TryOnState();
}

class _TryOnState extends State<TryOn> {
  String? tab = "Lipstick";

  onSubmit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset("assets/images/ar.png", fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => Get.back(),
                                borderRadius: BorderRadius.circular(99),
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    color: Get.find<ThemeController>().darkTheme
                                        ? Color(0xff_0d0d0d)
                                        : AppColors.offWhite.withValues(
                                            alpha: 0.17,
                                          ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          Get.find<ThemeController>().darkTheme
                                          ? Color(0xff_202020)
                                          : Color(0xff_ebebeb),
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomSvg(
                                      asset: AppIcons.back,
                                      color:
                                          Get.find<ThemeController>().darkTheme
                                          ? Color(0xff_dfdfdf)
                                          : null,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  "AR Try-on",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Get.find<ThemeController>().darkTheme
                                        ? Color(0xff_0d0d0d)
                                        : AppColors.offWhite,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 38, width: 38),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 26,
                              right: 26,
                              bottom: 18,
                              top: 8,
                            ),
                            child: cameraOverlay(),
                          ),
                        ),
                        Container(
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
                      ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.tryOnType == TryOnType.findProduct)
                    Column(
                      children: [
                        CustomTabs(
                          options: [
                            "Lipstick",
                            "Blush",
                            "Foundation",
                            "Eyeshadow",
                          ],
                          selected: tab,
                          onChanged: (val) {
                            setState(() {
                              tab = val;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomColorPicker(
                          colors: [
                            const Color(0xFF742C49), // #742C49
                            const Color(0xFF91385C), // #91385C
                            const Color(0xFF9A3B62), // #9A3B62
                            const Color(0xFFAE436E), // #AE436E
                            const Color(0xFFE76461), // #E76461 (100%)
                            const Color(0xCCE76461), // #E76461 (80% opacity)
                            const Color(0x99E76461), // #E76461 (60% opacity)
                            const Color(0x66E76461), // #E76461 (40% opacity)
                          ],
                          onChanged: (val) {},
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Match Fever Lipstick",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      CustomSvg(asset: "assets/icons/star.svg"),
                      const SizedBox(width: 4),
                      Text("4.5", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "VELYYA",
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Peachy Blush", style: TextStyle(fontSize: 18)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 1,
                    width: double.infinity,
                    color: Get.find<ThemeController>().darkTheme
                        ? Color(0xff_51001A)
                        : Color(0xff_F4ECE9),
                  ),
                  Text(
                    "Creamy, long-lasting lipstick that complements your skin undertone for a perfect match.",
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),

                  if (widget.tryOnType == TryOnType.findProduct)
                    actionBar(context),
                  if (widget.tryOnType != TryOnType.findProduct)
                    CustomButton(onTap: () {}, text: "Add to Bag"),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack cameraOverlay() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.offWhite, width: 2),
          ),
        ),
        Positioned(
          bottom: 18,
          left: 18,
          right: 18,
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Get.find<ThemeController>().darkTheme
                            ? Color(0x330D0D0D)
                            : Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE76461),
                            ),
                          ),
                          Text(
                            "Peachy Blus",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.offWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0x330D0D0D)
                      : Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: CustomSvg(asset: "assets/icons/peek.svg"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row actionBar(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        GestureDetector(
          onTap: () {
            saveAs(context);
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Get.find<ThemeController>().darkTheme
                    ? Color(0xff_51001A)
                    : Color(0xff_F6E4EB),
              ),
            ),
            child: Center(
              child: CustomSvg(
                asset: "assets/icons/heart.svg",
                color: Get.find<ThemeController>().darkTheme
                    ? AppColors.brandPrimary
                    : AppColors.brandSecondary,
                size: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: null,
            child: Container(
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.brandPrimary,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add to Bag",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Get.find<ThemeController>().darkTheme
                          ? Color(0xff_131313)
                          : AppColors.offWhite,
                    ),
                  ),
                  Text(
                    "\$29",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Get.find<ThemeController>().darkTheme
                          ? Color(0xff_0d0d0d)
                          : AppColors.offWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> saveAs(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Color(0xff_D9D9D9),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Add to saved Looks & Products",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Save as Look",
                          style: TextStyle(
                            color: Get.find<ThemeController>().darkTheme
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.find<ThemeController>().darkTheme
                              ? Color(0xff_0d0d0d)
                              : AppColors.offWhite,
                          border: Border.all(color: AppColors.textDisabled),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Get.find<ThemeController>().darkTheme
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  height: 1,
                  width: double.infinity,
                  color: Color(0xff_F4ECE9),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Opacity(
                    opacity: 0.4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Save as Product",
                            style: TextStyle(color: AppColors.textDisabled),
                          ),
                        ),
                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.find<ThemeController>().darkTheme
                                ? Color(0xff_0d0d0d)
                                : AppColors.offWhite,
                            border: Border.all(color: AppColors.textDisabled),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 24,
                              color: AppColors.textDisabled,
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
        );
      },
    );
  }
}
