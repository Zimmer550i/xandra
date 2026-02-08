import 'package:flutter/material.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';

class SavedVideosCard extends StatelessWidget {
  final bool isSaved;
  const SavedVideosCard({super.key, this.isSaved = false});

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
                image: AssetImage("assets/images/ar.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.30),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(child: CustomSvg(asset: "assets/icons/video.svg")),
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
                  "1 month ago",
                  style: TextStyle(color: AppColors.brandPrimary, height: 1),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.close, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 32),
              isSaved
                  ? CustomSvg(asset: "assets/icons/save_selected.svg")
                  : const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}
