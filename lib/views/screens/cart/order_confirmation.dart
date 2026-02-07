import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_button.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  onSubmit() async {
    Get.until((route) => route.settings.name == "/app");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              CustomSvg(asset: "assets/icons/payment_done.svg"),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "Your payment has been successfully done",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              Spacer(),
              CustomButton(onTap: onSubmit, text: "Go Back"),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
