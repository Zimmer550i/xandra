import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/screens/auth/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passCtrl = TextEditingController();
  final conPassCtrl = TextEditingController();

  onSubmit() async {
    Get.offAll(() => Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                "Reset Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                "Enter your new password here",
                style: TextStyle(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              CustomTextField(
                title: "Password",
                isPassword: true,
                controller: passCtrl,
                hintText: "******",
              ),
              const SizedBox(height: 12),
              CustomTextField(
                title: "Rewrite Password",
                isPassword: true,
                controller: conPassCtrl,
                hintText: "******",
              ),
              const SizedBox(height: 32),
              CustomButton(text: "Continue", onTap: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
