import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/base/profile_picture.dart';

class EditInformation extends StatefulWidget {
  const EditInformation({super.key});

  @override
  State<EditInformation> createState() => _EditInformationState();
}

class _EditInformationState extends State<EditInformation> {
  final nameCtrl = TextEditingController();
  File? image;

  onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Information"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_0D0D0D)
                      : AppColors.cardBackground,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : AppColors.borderDivider,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ProfilePicture(
                      image: "https://thispersondoesnotexist.com",
                      imageFile: image,
                      imagePickerCallback: (file) {
                        setState(() {
                          image = file;
                        });
                      },
                      isEditable: true,
                    ),
                    CustomTextField(
                      title: "Full Name",
                      controller: nameCtrl,
                      hintText: "Enter your name",
                    ),
                    const SizedBox(height: 16),
                    CustomButton(onTap: onSubmit, text: "Save Information"),
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
