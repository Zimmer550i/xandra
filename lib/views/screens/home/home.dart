import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:xandra/views/base/match_widget.dart';
import 'package:xandra/views/base/profile_picture.dart';
import 'package:xandra/views/screens/home/upload_information.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/homepage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Get.find<ThemeController>().darkTheme
                                  ? Color(0xff_181818)
                                  : const Color(0xe5_EBEBEB),
                              Colors.transparent,
                            ],
                            stops: [0, 0.7],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    productCard(),
                                    const SizedBox(height: 24),
                                    videoInformation(context),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                children: [
                                  Spacer(),
                                  Expanded(
                                    child: Column(
                                      spacing: 20,
                                      children: [
                                        actionButton("heart", 2789050, () {}),
                                        actionButton("save", 1500, () {}),
                                        actionButton("share", 150, () {}),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 20,
            child: SafeArea(
              child: actionButton(
                "creator",
                0,
                () => Get.to(() => UploadInformation()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container productCard() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Get.find<ThemeController>().darkTheme
            ? Color(0xff_252525).withValues(alpha: 0.78)
            : Color(0xff_e6e6e6).withValues(alpha: 0.72),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Match Fever Lipstick",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 2),
          Text("VELYYA", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 18),
          Row(
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff_E25B65),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text("Peachy Blush", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 8,
            children: [
              MatchWidget(val: 90),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_380018)
                      : AppColors.shopNowButton,
                ),
                child: Center(
                  child: Text(
                    "Shop Now",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.brandPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget videoInformation(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              size: 50,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Josefine Johnson",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),

                Text("@josefinejohnson", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          children: [
            for (int i = 0; i < 4; i++)
              Text(
                "#SoftGlam",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Align(alignment: Alignment.centerLeft, child: Text("Love this shade!")),
        SizedBox(height: 60 + MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }

  Column actionButton(String assetName, int count, void Function() onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Color(0xff_9E7B66),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomSvg(
                asset: "assets/icons/$assetName.svg",
                color: Get.find<ThemeController>().darkTheme
                    ? AppColors.offWhite
                    : AppColors.textPrimary,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _formatCount(count),
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  String _formatCount(int count) {
    if (count == 0) return "";
    
    if (count < 1000) {
      return count.toString();
    }

    if (count < 1000000) {
      final int whole = count ~/ 1000;
      final int remainder = (count % 1000) ~/ 100;
      return remainder == 0 ? '${whole}K' : '$whole.${remainder}K';
    }

    if (count < 1000000000) {
      final int whole = count ~/ 1000000;
      final int remainder = (count % 1000000) ~/ 100000;
      return remainder == 0 ? '${whole}M' : '$whole.${remainder}M';
    }

    final int whole = count ~/ 1000000000;
    final int remainder = (count % 1000000000) ~/ 100000000;
    return remainder == 0 ? '${whole}B' : '$whole.${remainder}B';
  }
}
