import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int)? onChanged;
  const CustomBottomNavbar({super.key, required this.index, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.find<ThemeController>().darkTheme
            ? AppColors.darkBackground
            : Color(0xff_faf9f7),
        border: Border.all(
          color: Get.find<ThemeController>().darkTheme
              ? Color(0xff_6B6B6F)
              : AppColors.borderDivider,
        ),
        borderRadius: BorderRadius.all(Radius.circular(999)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          item("Home", "home", 0),
          item("Try On", "try_on", 1),
          item("Explore", "logo", 2, false),
          item("Cart", "cart", 3),
          item("Profile", "profile", 4),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget item(String name, String icon, int pos, [bool applyColor = true]) {
    bool isSelected = pos == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) onChanged!(pos);
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            CustomSvg(
              asset: "assets/icons/$icon${isSelected ? "_selected" : ""}.svg",
              size: 24,
              color: !applyColor
                  ? null
                  : isSelected
                  ? AppColors.brandPrimary
                  : Get.find<ThemeController>().darkTheme
                  ? AppColors.darkTextSecondary
                  : AppColors.textSecondary,
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? AppColors.brandPrimary
                    : Get.find<ThemeController>().darkTheme
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
