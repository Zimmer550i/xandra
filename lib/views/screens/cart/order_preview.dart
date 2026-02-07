import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/product_card.dart';
import 'package:xandra/views/screens/cart/payment_method.dart';

class OrderPreview extends StatefulWidget {
  const OrderPreview({super.key});

  @override
  State<OrderPreview> createState() => _OrderPreviewState();
}

class _OrderPreviewState extends State<OrderPreview> {
  final data = {
    "Name": "User's Name",
    "Mobile Number": "+971 5X xxx xxxx",
    "Emirate": "Area, Business Bay",
    "Building": "Sharja Villa",
    "Apartment / Villa No.": "Sharja block-A",
    "Landmark": "Sharja Villa",
    "Estimated delivery": "3-5 days",
    "Delivery Note": "",
  };

  onSubmit() async {
    Get.to(() => PaymentMethod());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Preview"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(),
              Text(
                "Cart",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              for (int i = 0; i < 2; i++) ProductCard(),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 0),
                height: 1,
                width: double.infinity,
                color: Color(0xff_F4ECE9),
              ),
              Text(
                "Details",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 12, bottom: 12),
                    height: 1,
                    width: double.infinity,
                    color: Color(0xff_F4ECE9),
                  );
                },
                itemBuilder: (context, index) {
                  return field(
                    data.entries.elementAt(index).key,
                    data.entries.elementAt(index).value,
                  );
                },
              ),
              Text(
                "Please keep it on the table right beside the door",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 34),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.brandSecondary,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$18",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(onTap: onSubmit, text: "Make Payment"),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Row field(String key, String value) {
    return Row(
      spacing: 12,
      children: [
        Text(
          key,
          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
