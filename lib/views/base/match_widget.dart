import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';

class MatchWidget extends StatelessWidget {
  final double val;
  final bool showAmount;
  const MatchWidget({super.key, required this.val, this.showAmount = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Get.find<ThemeController>().darkTheme
            ? Color(0xff_003B1E)
            : AppColors.highMatchButton,
      ),
      child: Center(
        child: Text(
          "High Match${showAmount ? "  ${val.toInt()}%" : ""}",
          style: TextStyle(fontSize: 16, color: AppColors.success),
        ),
      ),
    );
  }
}
