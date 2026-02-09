import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_checkbox.dart';
import 'package:xandra/views/screens/auth/splash.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  int darkMode = 0;

  @override
  void initState() {
    super.initState();
    darkMode = Get.find<ThemeController>().darkTheme ? 0 : 1;
  }

  onSubmit() async {
    if ((darkMode == 0) != Get.find<ThemeController>().darkTheme) {
      Get.find<ThemeController>().toggleTheme();
    }
    Get.offAll(() => Splash(), transition: Transition.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Dark Mode"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 12,
          children: [
            options("Dark Mode", 0),
            options("Light Mode", 1),
            const SizedBox(height: 12),
            CustomButton(onTap: onSubmit, text: "Apply"),
            Text(
              "The app will be restarted when new theme mode is applied",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Get.find<ThemeController>().darkTheme
                    ? AppColors.offWhite
                    : Color(0xff_727272),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget options(String title, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          darkMode = pos;
        });
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Get.find<ThemeController>().darkTheme
                  ? Color(0xff2F2F2F)
                  : Color(0xff_919191),
            ),
          ),
          child: Row(
            spacing: 8,
            children: [
              CustomCheckBox(
                value: darkMode == pos,
                onChanged: (val) {
                  setState(() {
                    darkMode = pos;
                  });
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
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
}
