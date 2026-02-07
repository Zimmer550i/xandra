import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/base/custom_drop_down.dart';
import 'package:xandra/views/base/custom_text_field.dart';
import 'package:xandra/views/screens/home/upload_video.dart';

class UploadInformation extends StatefulWidget {
  const UploadInformation({super.key});

  @override
  State<UploadInformation> createState() => _UploadInformationState();
}

class _UploadInformationState extends State<UploadInformation> {
  onSubmit() async {
    Get.to(() => UploadVideo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Upload"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 16,
            children: [
              const SizedBox(),
              CustomDropDown(
                title: "Product Type",
                hintText: "Select your product type",
                options: ["Lipstick", "Blush", "Foundation", "Eyeshadow"],
              ),
              CustomTextField(
                title: "Caption",
                lines: 5,
                radius: 24,
                hintText: "Say something about your product",
              ),
              CustomTextField(
                title: "Product Shade",
                hintText: "Enter your product shade",
              ),
              CustomTextField(
                title: "Product Tags",
                hintText: "Enter your product tags",
              ),
              Spacer(),
              CustomButton(onTap: onSubmit, text: "Next"),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
