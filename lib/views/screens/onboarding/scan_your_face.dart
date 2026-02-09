import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/views/base/custom_button.dart';
import 'package:xandra/views/screens/app.dart';
import 'package:xandra/views/screens/onboarding/analyzing.dart';

class ScanYourFace extends StatefulWidget {
  const ScanYourFace({super.key});

  @override
  State<ScanYourFace> createState() => _ScanYourFaceState();
}

class _ScanYourFaceState extends State<ScanYourFace> {
  CameraController? _controller;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initCamera();
    });
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        debugPrint('No cameras available');
        return;
      }

      if (_isDisposed) return;

      final camera = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();

      if (_isDisposed) {
        await controller.dispose();
        return;
      }

      controller.addListener(() {
        if (_isDisposed) return;
        if (controller.value.hasError) {
          debugPrint('Camera error: ${controller.value.errorDescription}');
        }
      });

      if (mounted) {
        setState(() {
          _controller = controller;
        });
      } else {
        await controller.dispose();
      }
    } catch (e) {
      debugPrint('Camera initialization error: $e');
    }
  }

  Future<void> onSubmit() async {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      try {
        await controller.takePicture();
      } catch (e) {
        debugPrint("Capture failed: $e");
      }
    }
    if (mounted) {
      Get.to(() => const Analyzing());
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: _cameraViewport()),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    bottom: false,
                    child: Center(
                      child: Text(
                        "Position your face within the frame",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkCard
                          : AppColors.cardBackground,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(16, 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              color: Get.find<ThemeController>().darkTheme
                  ? AppColors.darkCard
                  : AppColors.cardBackground,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Text(
                    "Scan Your Face",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Our Al will analyze your skin tone and undertone for perfect shade matching",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.find<ThemeController>().darkTheme
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: onSubmit,
                    text: "Take Photo",
                    leading: "assets/icons/camera.svg",
                  ),
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => App(), routeName: "/app");
                    },
                    child: Text(
                      "Skip for now",
                      style: TextStyle(
                        color: Get.find<ThemeController>().darkTheme
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraViewport() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return Container(color: Colors.black);
    }

    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          child: CameraPreview(controller)),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
