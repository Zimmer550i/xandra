import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/app_texts.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkedImage extends StatelessWidget {
  final String? url;
  final File? file;
  final String? randomSeed;
  final double? height;
  final double? width;
  final double radius;
  final bool shimmer;
  final BoxFit? fit;
  const CustomNetworkedImage({
    super.key,
    this.url,
    this.randomSeed,
    this.height,
    this.width,
    this.radius = 10,
    this.fit = BoxFit.cover,
    this.shimmer = true,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(radius),
      child: file != null
          ? Image.file(file!, height: height, width: width, fit: fit)
          : url == null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(color: AppColors.textDisabled),
              child: Center(child: Icon(Icons.error_outline_rounded)),
            )
          : CachedNetworkImage(
              imageUrl: url!,
              // "https://picsum.photos/${randomSeed == null ? "" : "seed/$randomSeed/"}${(width ?? 400).toInt()}/${(height ?? 400).toInt()}",
              height: height,
              width: width,
              fit: fit,
              errorWidget: (context, url, error) {
                return Container(
                  height: height,
                  width: width,
                  color: AppColors.textDisabled,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Get.find<ThemeController>().darkTheme
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                        Expanded(
                          child: Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                            style: AppTexts.tsmr.copyWith(
                              color: Get.find<ThemeController>().darkTheme
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Get.find<ThemeController>().darkTheme
                      ? Color(0xff_380018)
                      : AppColors.brandSecondary,
                  highlightColor: AppColors.textDisabled,
                  period: Duration(milliseconds: 800),
                  child: Container(
                    height: height ?? width,
                    width: width ?? height,
                    color: Colors.white,
                  ),
                );
              },
            ),
    );
  }
}
