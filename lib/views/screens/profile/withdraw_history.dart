import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';

class WithdrawHistory extends StatelessWidget {
  const WithdrawHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Withdraw History"),
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewPadding.bottom + 4,
        ),
        itemCount: 20,
        separatorBuilder: (context, index) => Container(
          height: 1,
          width: double.infinity,
          color: Get.find<ThemeController>().darkTheme
              ? AppColors.textSecondary
              : AppColors.borderDivider,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8),
            child: Row(
              spacing: 12,
              children: [
                CustomSvg(asset: "assets/icons/stripe.svg", size: 28),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stripe",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Date : May 31, 2024",
                        style: TextStyle(
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        "ID : BCFG354JUYHG",
                        style: TextStyle(
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "-\$1500",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
