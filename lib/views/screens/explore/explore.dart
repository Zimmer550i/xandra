import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_tabs.dart';
import 'package:xandra/views/screens/explore/product_details.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String? tab;

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
                border: Border.all(color: AppColors.borderDivider),
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
                        hintStyle: TextStyle(color: AppColors.textSecondary),
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
          border: Border.all(color: AppColors.borderDivider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderDivider),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage("assets/images/product.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text("GLOW LUXE", style: TextStyle(color: AppColors.textSecondary)),

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
