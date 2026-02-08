import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({super.key});

  onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Withdraw"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : AppColors.borderDivider,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    field("Available Balance", "\$2,780 USD", size: 18),
                    seperator(),
                    field("Pending Earnings", "\$2,780 USD", size: 18),
                    const SizedBox(height: 8),
                    Text(
                      "Total earning, this month, clears in 7-14 days",
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                    seperator(),
                    field(
                      "Total Earnings(This Month)",
                      "\$2,780 USD",
                      size: 18,
                    ),
                    seperator(),
                    field("Next Payout Date", "May 31, 2024", size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : AppColors.borderDivider,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Withdraw Funds",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.brandPrimary,
                      ),
                    ),
                    seperator(),
                    Text(
                      "Bank Transfer",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    field("Account Holder:", "Mary Adams"),
                    field("Bank Name:", "Jonota Bank"),
                    field("Swift/ BIC Code:", "EHAJKXXHIFHIKA"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              field("Minimum withdrawal amount:", "AED 100", nameSize: 14),
              const SizedBox(height: 12),
              Text(
                "Withdrawals are processes within 2-5 busines days",
                style: TextStyle(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_380018)
                      : AppColors.brandSecondary,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Withdraw Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$1800",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              CustomButton(onTap: onSubmit, text: "Withdraw"),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: " • By withdrawing, you agree to ",
                  style: TextStyle(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.offWhite
                        : Color(0xff_727272),
                  ),
                  children: [
                    TextSpan(
                      text: "Xandra’s payout terms",
                      style: TextStyle(
                        color: AppColors.brandPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.find<ThemeController>().toggleTheme();
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  seperator() {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      height: 1,
      width: double.infinity,
      color: Color(0xff_F4ECE9),
    );
  }

  Row field(
    String key,
    String value, {
    double size = 16,
    double nameSize = 16,
  }) {
    return Row(
      spacing: 12,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: nameSize,
            color: Get.find<ThemeController>().darkTheme
                ? AppColors.darkTextSecondary
                : AppColors.textSecondary,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
