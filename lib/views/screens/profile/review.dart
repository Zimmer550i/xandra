import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_text_field.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  onSubmit() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Review"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                "How would you rate your experience?",
                style: TextStyle(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: RatingBar(
                  ratingWidget: RatingWidget(
                    full: CustomSvg(asset: "assets/icons/star.svg"),
                    half: CustomSvg(asset: "assets/icons/star.svg"),
                    empty: CustomSvg(asset: "assets/icons/star_empty.svg"),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 10),
                  glow: false,
                  onRatingUpdate: (val) {},
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                title: "Write a review",
                lines: 8,
                radius: 16,
                hintText: "Write something about your experience",
              ),
              Spacer(),
              CustomButton(onTap: onSubmit, text: "Submit"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
