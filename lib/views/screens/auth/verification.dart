import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/screens/auth/reset_password.dart';
import 'package:xandra/views/screens/onboarding/start_journey.dart';

class Verification extends StatefulWidget {
  final bool isResettingPassword;
  final String email;
  const Verification({
    super.key,
    this.isResettingPassword = false,
    required this.email,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final otpCtrl = TextEditingController();
  Timer? _timer;
  int _secondsRemaining = 59;
  bool _canResend = true;

  @override
  void dispose() {
    _timer?.cancel();
    otpCtrl.dispose();
    super.dispose();
  }

  onSubmit() async {
    if (widget.isResettingPassword) {
      Get.to(() => ResetPassword());
    } else {
      Get.to(() => StartJourney());
    }
  }

  void _startTimer() {
    _secondsRemaining = 59;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
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
                "Check your email",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: "Please enter the four verification code we sent to ",
                  style: TextStyle(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: widget.email,
                      style: TextStyle(color: AppColors.brandPrimary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Pinput(
                length: 4,
                separatorBuilder: (index) => const SizedBox(width: 16),
                defaultPinTheme: PinTheme(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xff_919191)),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.brandPrimary),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(text: "Continue", onTap: onSubmit),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: "Didn’t get the email?",
                  style: TextStyle(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: _canResend
                          ? " Resend code"
                          : " Resend in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
                      style: TextStyle(color: AppColors.brandPrimary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (_canResend) {
                            setState(() {
                              _startTimer();
                            });
                          }
                        },
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
