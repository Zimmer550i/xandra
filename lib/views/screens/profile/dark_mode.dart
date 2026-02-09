import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_checkbox.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Dark Mode"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 12,
          children: [options("Enabled", 0), options("Disabled", 1)],
        ),
      ),
    );
  }

  Widget options(String title, int pos) {
    return GestureDetector(
      onTap: () {
        darkMode = pos;
        Get.find<ThemeController>().toggleTheme();
        // Get.offAll(
        //   () => App(key: appKey),
        //   routeName: "/app",
        //   transition: Transition.noTransition,
        // );
        // appKey.currentState?.setIndex(4);
        // Get.to(() => Settings(), transition: Transition.noTransition);
        // Get.to(() => DarkMode(), transition: Transition.noTransition);
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
