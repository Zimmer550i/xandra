import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_tabs.dart';
import 'package:xandra/views/base/product_card_squared.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String? tab = "Lipstick";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Explore", hasLeading: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.textSecondary
                      : AppColors.borderDivider,
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                spacing: 4,
                children: [
                  CustomSvg(asset: "assets/icons/search.svg"),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomTabs(
              options: ["Lipstick", "Blush", "Foundation", "Eyeshadow"],
              selected: tab,
              onChanged: (val) {
                setState(() {
                  tab = val;
                });
              },
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(
                  top: 12,
                  bottom: 85 + MediaQuery.of(context).padding.bottom,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCardSquared();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
