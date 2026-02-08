import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_snackbar.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/screens/explore/product_details.dart';
import 'package:xandra/views/screens/profile/review.dart';

enum CardType { cart, saved, history }

class ProductCard extends StatelessWidget {
  final CardType cardType;
  const ProductCard({super.key, this.cardType = CardType.cart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails()),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Get.find<ThemeController>().darkTheme
              ? Color(0xff_0d0d0d)
              : AppColors.cardBackground,
          border: Border.all(
            color: Get.find<ThemeController>().darkTheme
                ? AppColors.textSecondary
                : AppColors.borderDivider,
          ),
        ),
        child: Column(
          spacing: 8,
          children: [
            Row(
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
                      image: AssetImage("assets/images/product.png"),
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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
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
                      if (cardType != CardType.history)
                        Text(
                          "\$28",
                          style: TextStyle(
                            color: AppColors.brandPrimary,
                            height: 1,
                          ),
                        ),
                    ],
                  ),
                ),
                if (cardType == CardType.cart) cartActions(),
                if (cardType == CardType.saved) savedActions(),
                if (cardType == CardType.history)
                  Text(
                    "\$28",
                    style: TextStyle(color: AppColors.brandPrimary, height: 1),
                  ),
              ],
            ),
            if (cardType == CardType.history)
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        // Add to cart
                        customSnackBar(
                          "Product added to the cart",
                          isError: false,
                        );
                      },
                      text: "Reorder",
                      fontSize: 14,
                      height: 30,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Get.to(() => Review());
                      },
                      text: "Leave review",
                      fontSize: 14,
                      height: 30,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Column cartActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(child: CustomSvg(asset: "assets/icons/delete.svg")),
        const SizedBox(height: 32),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
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
                    Icons.remove,
                    size: 24,
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 36,
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
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
            ),
          ],
        ),
      ],
    );
  }

  Column savedActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.close, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 32),
        CustomSvg(asset: "assets/icons/heart_selected.svg"),
      ],
    );
  }
}
