import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/screens/auth/verification.dart';

class ForgotPassword extends StatefulWidget {
  final String? email;
  const ForgotPassword({super.key, this.email});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailCtrl.text = widget.email ?? "";
  }

  onSubmit() async {
    Get.to(
      () => Verification(isResettingPassword: true, email: emailCtrl.text),
    );
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
                "Forget password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                "We will send a 4 digit verification code to verify your email",
                style: TextStyle(
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              CustomTextField(
                title: "Email",
                controller: emailCtrl,
                hintText: "wasiul0491@gmail.com",
              ),
              const SizedBox(height: 12),
              CustomButton(text: "Continue", onTap: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
