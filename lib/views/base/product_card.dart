import 'package:flutter/material.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';

enum CardType { cart }

class ProductCard extends StatelessWidget {
  final CardType cardType;
  const ProductCard({super.key, this.cardType = CardType.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.borderDivider),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderDivider),
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
                  style: TextStyle(color: AppColors.textSecondary),
                ),

                Text(
                  "Velvet Matt",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rose Petal",
                  style: TextStyle(color: AppColors.textSecondary, height: 1),
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
                child: CustomSvg(asset: "assets/icons/delete.svg"),
              ),
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
                        color: AppColors.offWhite,
                        border: Border.all(color: AppColors.textDisabled),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          size: 24,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(color: AppColors.textSecondary),
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
                        color: AppColors.offWhite,
                        border: Border.all(color: AppColors.textDisabled),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
