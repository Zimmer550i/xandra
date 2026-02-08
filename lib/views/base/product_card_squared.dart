import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/screens/explore/product_details.dart';

class ProductCardSquared extends StatelessWidget {
  const ProductCardSquared({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails()),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardBackground,
          border: Border.all(
            color: Get.find<ThemeController>().darkTheme
                ? AppColors.textSecondary
                : AppColors.borderDivider,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : AppColors.borderDivider,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage("assets/images/product.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
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
            Spacer(),
            Row(
              children: [
                Text(
                  "\$28",
                  style: TextStyle(color: AppColors.brandPrimary, height: 1),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.shopNowButton,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    spacing: 2,
                    children: [
                      CustomSvg(asset: "assets/icons/beauty.svg", size: 18),
                      Text(
                        "90%",
                        style: TextStyle(
                          color: AppColors.brandPrimary,
                          height: 1,
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
    );
  }
}
