import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_checkbox.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/screens/auth/forgot_password.dart';
import 'package:xandra/views/screens/auth/signup.dart';
import 'package:xandra/views/screens/onboarding/start_journey.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool rememeberMe = false;

  onSubmit() async {
    Get.to(() => StartJourney());
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
                "Welcome Back!",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                "Log In",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Get.find<ThemeController>().darkTheme
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 44),
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

              const SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        rememeberMe = !rememeberMe;
                      });
                    },
                    child: Row(
                      children: [
                        CustomCheckBox(
                          size: 12,
                          activeColor: AppColors.brandPrimary,
                          borderRadius: BorderRadius.circular(3),
                          value: rememeberMe,
                          onChanged: (val) {
                            setState(() {
                              rememeberMe = val;
                            });
                          },
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                            color: Get.find<ThemeController>().darkTheme
                                ? AppColors.offWhite
                                : Color(0xff_727272),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ForgotPassword(email: emailCtrl.text));
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: AppColors.brandPrimary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomButton(onTap: onSubmit, text: "Login"),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: "Don’t have an account?",
                  style: TextStyle(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.offWhite
                        : Color(0xff_727272),
                  ),
                  children: [
                    TextSpan(
                      text: " Sign Up",
                      style: TextStyle(color: AppColors.brandPrimary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => Signup());
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
