import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/screens/try_on/try_on.dart';

class LookCard extends StatelessWidget {
  const LookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TryOn(tryOnType: TryOnType.saved)),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Get.find<ThemeController>().darkTheme
              ? Color(0xff_0D0D0D)
              : AppColors.cardBackground,
          border: Border.all(
            color: Get.find<ThemeController>().darkTheme
                ? AppColors.textSecondary
                : AppColors.borderDivider,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.textSecondary
                      : AppColors.borderDivider,
                ),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage("assets/images/ar.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GLOW LUXE",
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),

                  Text(
                    "Velvet Matt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rose Petal",
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$28",
                    style: TextStyle(color: AppColors.brandPrimary, height: 1),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.close, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 32),
                CustomSvg(asset: "assets/icons/heart_selected.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
