import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/models/cliclable_object.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_checkbox.dart';
import 'package:xandra/views/screens/cart/order_confirmation.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  List<CliclableObject> data = [
    CliclableObject(title: "Stripe", assetName: 'stripe'),
    CliclableObject(title: "Apple", assetName: 'apple'),
    CliclableObject(title: "Google", assetName: 'google'),
  ];
  int? selectedMethod;

  onSubmit() async {
    Get.to(() => OrderConfirmation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Method'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff_ebebeb)),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xff_F4ECE9),
                    );
                  },
                  itemBuilder: (context, index) {
                    return methods(
                      data.elementAt(index).title,
                      data.elementAt(index).assetName,
                      index,
                    );
                  },
                ),
              ),
              Spacer(),
              CustomButton(onTap: onSubmit, text: "Continue"),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget methods(String title, String assetName, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = pos;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          spacing: 8,
          children: [
            CustomSvg(asset: "assets/icons/$assetName.svg", size: 24),
            Expanded(
              child: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            CustomCheckBox(
              value: pos == selectedMethod,
              onChanged: (val) {
                setState(() {
                  selectedMethod = pos;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
