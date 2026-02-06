import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_checkbox.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/screens/auth/splash.dart';
import 'package:xandra/views/screens/auth/verification.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final conPassCtrl = TextEditingController();
  bool agreedTerms = false;

  onSubmit() async {
    Get.to(() => Verification(email: emailCtrl.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              CustomSvg(asset: "assets/icons/logo.svg", size: 36),
              const SizedBox(height: 16),
              Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 44),
              CustomTextField(
                title: "Name",
                controller: nameCtrl,
                hintText: "John Doe",
              ),
              const SizedBox(height: 12),
              CustomTextField(
                title: "Email",
                controller: emailCtrl,
                hintText: "wasiul0491@gmail.com",
              ),
              const SizedBox(height: 12),
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

              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: CustomCheckBox(
                      size: 12,
                      activeColor: AppColors.brandPrimary,
                      borderRadius: BorderRadius.circular(3),
                      value: agreedTerms,
                      onChanged: (val) {
                        setState(() {
                          agreedTerms = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "By signing up , you are agreeing to ",
                        style: TextStyle(
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.offWhite
                              : Color(0xff_727272),
                        ),
                        children: [
                          TextSpan(
                            text: "Terms of services",
                            style: TextStyle(color: AppColors.brandPrimary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.find<ThemeController>().toggleTheme();
                              },
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: AppColors.brandPrimary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => Splash());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomButton(onTap: onSubmit, text: "Signup"),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.offWhite
                        : Color(0xff_727272),
                  ),
                  children: [
                    TextSpan(
                      text: " Log In",
                      style: TextStyle(color: AppColors.brandPrimary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                spacing: 12,
                children: [
                  const SizedBox(width: 4),
                  Expanded(child: Divider(color: Color(0xff_787878))),
                  Text(
                    "Or continue with",
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.offWhite
                          : Color(0xff_787878),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xff_787878))),
                  const SizedBox(width: 4),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xff_bebebe)),
                        ),
                        child: Center(
                          child: Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvg(asset: "assets/icons/google.svg"),
                              Text(
                                "Google",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xff_bebebe)),
                        ),
                        child: Center(
                          child: Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvg(
                                asset: "assets/icons/apple.svg",
                                color: Get.find<ThemeController>().darkTheme
                                    ? Colors.white
                                    : null,
                              ),
                              Text(
                                "Apple",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
