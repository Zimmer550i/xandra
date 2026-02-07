import 'package:flutter/material.dart';
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
        color: AppColors.highMatchButton,
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
