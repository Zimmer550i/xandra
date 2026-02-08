import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/match_widget.dart';
import 'package:xandra/views/screens/try_on/try_on.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Lipstick"),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 2,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/product.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 12,
                      child: MatchWidget(val: 98, showAmount: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            : Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Peachy Blush",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          "\$29",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Creamy, long-lasting lipstick that complements your skin undertone for a perfect match.",
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 24),
                      height: 1,
                      width: double.infinity,
                      color: Get.find<ThemeController>().darkTheme
                          ? Color(0xff_271913)
                          : Color(0xff_F4ECE9),
                    ),
                    Text(
                      "Based on your skin tone & undertone",
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      spacing: 20,
                      children: [
                        for (var i in [
                          const Color(0xFF742C49), // #742C49
                          const Color(0xFF91385C), // #91385C
                          const Color(0xFF9A3B62), // #9A3B62
                          const Color(0xFFAE436E), // #AE436E
                          const Color(0xFFE76461), // #E76461 (100%)
                          const Color(0xCCE76461), // #E76461 (80% opacity)
                          const Color(0x99E76461), // #E76461 (60% opacity)
                          const Color(0x66E76461), // #E76461 (40% opacity)
                        ])
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i,
                            ),
                          ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 24),
                      height: 1,
                      width: double.infinity,
                      color: Get.find<ThemeController>().darkTheme
                          ? Color(0xff_271913)
                          : Color(0xff_F4ECE9),
                    ),
                    // No idea how this section works
                    // No one does
                    Text("Review", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 12),
                    Text(
                      "Creamy, long-lasting lipstick that complements your skin undertone for a perfect match.",
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(
                            () => TryOn(tryOnType: TryOnType.tryOnProduct),
                          ),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Get.find<ThemeController>().darkTheme
                                    ? Color(0xff_271913)
                                    : Color(0xff_F6E4EB),
                              ),
                            ),
                            child: Center(
                              child: CustomSvg(
                                asset: "assets/icons/try_on.svg",
                                color: Get.find<ThemeController>().darkTheme
                                    ? AppColors.brandPrimary
                                    : AppColors.brandSecondary,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
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
                                            borderRadius: BorderRadius.circular(
                                              99,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        Text(
                                          "Add to saved Looks & Products",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Opacity(
                                            opacity: 0.4,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Save as Look",
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .textDisabled,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 28,
                                                  width: 28,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        Get.find<
                                                              ThemeController
                                                            >()
                                                            .darkTheme
                                                        ? Color(0xff_0d0d0d)
                                                        : AppColors.offWhite,
                                                    border: Border.all(
                                                      color: AppColors
                                                          .textDisabled,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 24,
                                                      color: AppColors
                                                          .textDisabled,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                          ),
                                          height: 1,
                                          width: double.infinity,
                                          color:
                                              Get.find<ThemeController>()
                                                  .darkTheme
                                              ? Color(0xff_271913)
                                              : Color(0xff_F4ECE9),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Save as Product",
                                                  style: TextStyle(),
                                                ),
                                              ),
                                              Container(
                                                height: 28,
                                                width: 28,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Get.find<
                                                            ThemeController
                                                          >()
                                                          .darkTheme
                                                      ? Color(0xff_0d0d0d)
                                                      : AppColors.offWhite,
                                                  border: Border.all(
                                                    color:
                                                        AppColors.textDisabled,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 24,
                                                    color:
                                                        Get.find<
                                                              ThemeController
                                                            >()
                                                            .darkTheme
                                                        ? AppColors
                                                              .darkTextSecondary
                                                        : AppColors
                                                              .textSecondary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Get.find<ThemeController>().darkTheme
                                    ? Color(0xff_271913)
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
                        Expanded(child: CustomButton(text: "Add to Bag")),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
