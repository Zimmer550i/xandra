import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/app_icons.dart';
import 'package:xandra/utils/custom_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  final Widget? trailing;
  const CustomAppBar({
    super.key,
    required this.title,
    this.hasLeading = true,
    this.trailing,
  });

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.find<ThemeController>().darkTheme
          ? AppColors.darkBackground
          : AppColors.offWhite,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            InkWell(
              onTap: () => hasLeading ? Get.back() : null,
              borderRadius: BorderRadius.circular(99),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkBackground
                      : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? Color(0xff_202020)
                        : Color(0xff_ebebeb),
                  ),
                ),
                child: hasLeading
                    ? Center(
                        child: CustomSvg(
                          asset: AppIcons.back,
                          color: Get.find<ThemeController>().darkTheme
                              ? Color(0xff_dfdfdf)
                              : null,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_e1e1e3)
                      : null,
                ),
              ),
            ),
            const SizedBox(width: 8),
            trailing != null
                ? trailing!
                : const SizedBox(height: 38, width: 38),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
