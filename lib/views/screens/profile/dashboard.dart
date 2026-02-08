import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/saved_videos_card.dart';
import 'package:xandra/views/screens/profile/withdraw_history.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Dashboard"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.borderDivider),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Products & Sales",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.brandPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Based on your products",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 15,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.offWhite,
                              border: Border.all(
                                color: AppColors.borderDivider,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSvg(asset: "assets/icons/views.svg"),
                                Text("Views"),
                                Text(
                                  "2300",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.offWhite,
                              border: Border.all(
                                color: AppColors.borderDivider,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSvg(asset: "assets/icons/sales.svg"),
                                Text("Sales"),
                                Text(
                                  "\$2500",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        border: Border.all(color: AppColors.borderDivider),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              CustomSvg(asset: "assets/icons/commision.svg"),
                              Text("Commission earned"),
                            ],
                          ),
                          Text(
                            "\$250 USD",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => WithdrawHistory());
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.offWhite,
                          border: Border.all(color: AppColors.borderDivider),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                CustomSvg(
                                  asset: "assets/icons/history.svg",
                                  color: AppColors.textPrimary,
                                ),
                                Text("See Withdraw History"),
                              ],
                            ),
                            Text(
                              "May 31, 2024",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Uploaded videos",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: MediaQuery.of(context).viewPadding.bottom + 4,
                ),
                itemCount: 20,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => SavedVideosCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
