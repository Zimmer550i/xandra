import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_checkbox.dart';
import 'package:xandra/views/base/custom_drop_down.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/screens/cart/order_preview.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final buildingCtrl = TextEditingController();
  final apartmentCtrl = TextEditingController();
  final landmarkCtrl = TextEditingController();
  final noteCtrl = TextEditingController();
  String? emirate;
  String? area;
  int? deliveryOption;

  onSubmit() async {
    Get.to(() => OrderPreview());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Order Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_0d0d0d)
                      : Colors.white,
                  border: Border.all(
                    color: Get.find<ThemeController>().darkTheme
                        ? AppColors.textSecondary
                        : Color(0xff_ebebeb),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Column(
                  spacing: 12,
                  children: [
                    CustomTextField(
                      title: "Full Name",
                      controller: nameCtrl,
                      hintText: "Jenny",
                    ),
                    CustomTextField(
                      title: "Mobile Number",
                      controller: phoneCtrl,
                      textInputType: TextInputType.number,
                      hintText: "+880 xxx xxxxxx",
                    ),
                    CustomDropDown(
                      options: [],
                      title: "Emirates",
                      hintText: "Dubai",
                      onChanged: (val) {
                        setState(() {
                          emirate = val;
                        });
                      },
                    ),
                    CustomDropDown(
                      options: [],
                      title: "Area / Community",
                      hintText: "Area",
                      onChanged: (val) {
                        setState(() {
                          area = val;
                        });
                      },
                    ),
                    CustomTextField(
                      title: "Building",
                      controller: buildingCtrl,
                      hintText: "Burj Khalifa",
                    ),
                    CustomTextField(
                      title: "Apartment / Villa no.",
                      controller: apartmentCtrl,
                      hintText: "415 / a",
                    ),
                    CustomTextField(
                      title: "Lardmark",
                      isOptional: true,
                      controller: landmarkCtrl,
                      hintText: "e.g, near Spinneys grocery store",
                    ),
                    Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Method",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            // fontWeight: FontWeight.w500,
                            fontVariations: [FontVariation("wght", 500)],
                            height: 1.5,
                          ),
                        ),
                        deliveryMethods(
                          "Same-Day Delivery",
                          "Today; 3-6 PM",
                          "30",
                          0,
                        ),
                        deliveryMethods(
                          "Next-Day Delivery",
                          "Tomorrow; 3-6 PM",
                          "30",
                          1,
                        ),
                        deliveryMethods(
                          "Standard Delivery",
                          "Within 2-3 Days",
                          "Free",
                          2,
                        ),
                      ],
                    ),
                    CustomTextField(
                      title: "Delivery Notes",
                      controller: noteCtrl,
                      lines: 6,
                      radius: 16,
                      hintText:
                          "Add some additional information for Delivery Man",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              CustomButton(onTap: onSubmit, text: "Continue"),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget deliveryMethods(String title, String subtitle, String price, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          deliveryOption = pos;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xff_919191)),
        ),
        child: Row(
          spacing: 8,
          children: [
            CustomCheckBox(
              value: deliveryOption == pos,
              onChanged: (val) {
                setState(() {
                  deliveryOption = pos;
                });
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "$price AED",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
