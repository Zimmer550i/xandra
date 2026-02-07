import 'package:flutter/material.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';

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
                child: Image.asset(
                  "assets/images/product.png",
                  fit: BoxFit.fitWidth,
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
                        color: AppColors.textSecondary,
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
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 24),
                      height: 1,
                      width: double.infinity,
                      color: Color(0xff_F4ECE9),
                    ),
                    Text(
                      "Based on your skin tone & undertone",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      spacing: 20,
                      children: [
                        for (int i = 0; i < 8; i++)
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff_D4B896),
                            ),
                          ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 24),
                      height: 1,
                      width: double.infinity,
                      color: Color(0xff_F4ECE9),
                    ),
                    // No idea how this section works
                    // No one does
                    Text("Review", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 12),
                    Text(
                      "Creamy, long-lasting lipstick that complements your skin undertone for a perfect match.",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      spacing: 8,
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
                              asset: "assets/icons/try_on.svg",
                              color: AppColors.brandSecondary,
                              size: 24,
                            ),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xff_F6E4EB)),
                          ),
                          child: Center(
                            child: CustomSvg(
                              asset: "assets/icons/heart.svg",
                              color: AppColors.brandSecondary,
                              size: 24,
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
