import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';

class CustomTabs extends StatelessWidget {
  final List<String> options;
  final String? selected;
  final void Function(String)? onChanged;
  const CustomTabs({
    super.key,
    required this.options,
    this.selected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (var i in options)
            GestureDetector(
              onTap: () {
                onChanged?.call(i);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: selected == i
                      ? Get.find<ThemeController>().darkTheme
                            ? Color(0xff_46160C)
                            : Color(0xff_F7D6CF)
                      : null,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Center(
                  child: Text(
                    i,
                    style: TextStyle(
                      fontSize: 16,
                      color: selected == i
                          ? (Get.find<ThemeController>().darkTheme
                                ? AppColors.darkText
                                : AppColors.textPrimary)
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
