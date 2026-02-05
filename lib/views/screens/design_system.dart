import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_bottom_navbar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/base/profile_picture.dart';
import 'package:xandra/views/base/pull_to_refresh.dart';

class DesignSystem extends StatefulWidget {
  const DesignSystem({super.key});

  @override
  State<DesignSystem> createState() => _DesignSystemState();
}

class _DesignSystemState extends State<DesignSystem> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
        onChanged: (val) {
          setState(() {
            index = val;
          });
        },
      ),
      appBar: CustomAppBar(title: "Design System"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PullToRefresh(
          onRefresh: () async {
            return Future.delayed(Duration(seconds: 1));
          },
          child: Column(
            spacing: 16,
            children: [
              ProfilePicture(
                image: "https://picsum.photos/500/500",
                isEditable: true,
              ),
              CustomTextField(title: "Email", hintText: "Enter your email"),
              CustomTextField(
                title: "Password",
                hintText: "Enter your password",
                isPassword: true,
              ),
              CustomButton(
                onTap: () {
                  Get.find<ThemeController>().toggleTheme();
                },
                text: "Button",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
