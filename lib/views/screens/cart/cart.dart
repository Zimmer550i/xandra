import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/product_card.dart';
import 'package:xandra/views/screens/app.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  onSubmit() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart", hasLeading: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            const SizedBox(height: 6),
            // emptyCart(context),
            for (int i = 0; i < 2; i++) ProductCard(),

            CustomButton(onTap: onSubmit, text: "Checkout"),

            SafeArea(child: SizedBox(height: 73)),
          ],
        ),
      ),
    );
  }

  Widget emptyCart(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 4),
        Image.asset("assets/images/empty.png", height: 100, width: 100),
        const SizedBox(height: 28),
        Text(
          "Your cart is empty",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            "Discover beauty products personalized for your skin tone",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Get.find<ThemeController>().darkTheme
                  ? AppColors.darkTextSecondary
                  : AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          onTap: () {
            appKey.currentState?.setIndex(2);
          },
          text: "Start Shopping",
          width: null,
          height: 40,
        ),
      ],
    );
  }
}
