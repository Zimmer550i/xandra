import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:xandra/views/base/match_widget.dart';
import 'package:xandra/views/base/profile_picture.dart';
import 'package:xandra/views/screens/home/upload_information.dart';

/// Default portrait controls.
class CustomFlickPortraitControls extends StatelessWidget {
  final double iconSize;
  final double fontSize;
  final FlickProgressBarSettings? progressBarSettings;
  const CustomFlickPortraitControls({
    super.key,
    this.iconSize = 20,
    this.fontSize = 12,
    this.progressBarSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
        Positioned(
          top: 0,
          right: 20,
          child: SafeArea(
            child: actionButton(
              context,
              "creator",
              0,
              () => Get.to(() => UploadInformation()),
            ),
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              productCard(context),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 20,
                                children: [
                                  Spacer(),
                                  actionButton(
                                    context,
                                    "heart",
                                    2789050,
                                    () {},
                                  ),
                                  actionButton(context, "save", 1500, () {}),
                                  actionButton(context, "share", 150, () {}),
                                  Spacer(),
                                  FlickAutoHideChild(child: FlickSoundToggle()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "Love this shade!",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      FlickAutoHideChild(
                        child: Row(
                          children: <Widget>[
                            FlickCurrentPosition(
                              fontSize: fontSize,
                              color: Theme.of(
                                context,
                              ).textTheme.titleMedium?.color,
                            ),
                            Text(
                              ' / ',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontSize: fontSize),
                            ),
                            FlickTotalDuration(
                              fontSize: fontSize,
                              color: Theme.of(
                                context,
                              ).textTheme.titleMedium?.color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FlickAutoHideChild(
                    child: FlickVideoProgressBar(
                      flickProgressBarSettings: FlickProgressBarSettings(
                        playedColor: AppColors.brandPrimary,
                        bufferedColor: AppColors.brandSecondary,
                        padding: EdgeInsetsGeometry.all(0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(height: 73),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    showIfVideoNotInitialized: false,
                    child: FlickPlayToggle(
                      size: iconSize * 1.5,
                      color: AppColors.brandPrimary,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.titleMedium?.color?.withAlpha(128),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container productCard(BuildContext context) {
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
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "VELYYA",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 16),
          ),
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
                child: Text(
                  "Peachy Blush",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 16),
                ),
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),

                Text(
                  "@josefinejohnson",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 16),
                ),
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Column actionButton(
    BuildContext context,
    String assetName,
    int count,
    void Function() onTap,
  ) {
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
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
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
