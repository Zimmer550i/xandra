import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:xandra/utils/app_colors.dart';
import 'package:xandra/utils/custom_flick_landscape_controls.dart';
import 'package:xandra/utils/custom_flick_portrait_controls.dart';
import 'package:xandra/utils/custom_svg.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  final int? startAtSeconds;
  final Function()? onMarkComplete;
  final Function(int seconds)? onProgressSave;
  const VideoWidget(
    this.url, {
    super.key,
    this.startAtSeconds,
    this.onMarkComplete,
    this.onProgressSave,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late FlickManager flickManager;
  late VideoPlayerController _controller;
  Timer? _progressSaveTimer;
  bool _hasMarkedComplete = false;

  /*
  Bug: When the video pauses when load buffers there is no loading animation.
  Update 1: Didn't find the issue. Next time if not found mark this as complete.
  */

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    flickManager = FlickManager(videoPlayerController: _controller);

    _controller.addListener(() {
      if (_controller.value.hasError) {
        debugPrint('❌ Error: ${_controller.value.errorDescription}');
        debugPrint('Controller value: ${_controller.value}');
        setState(() {});
      }

      if (!_hasMarkedComplete && _controller.value.position.inSeconds >= 5) {
        _hasMarkedComplete = true;
        widget.onMarkComplete?.call();
        debugPrint('✅ Video marked as complete after 5 seconds');
      }
    });

    if (widget.startAtSeconds != null) {
      _controller.addListener(_seekToStartPosition);
    }

    _progressSaveTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      _saveProgress();
    });
  }

  void _seekToStartPosition() {
    if (_controller.value.isInitialized) {
      _controller.seekTo(Duration(seconds: widget.startAtSeconds!));
      _controller.removeListener(_seekToStartPosition);
      debugPrint('🎬 Started video at ${widget.startAtSeconds} seconds');
    }
  }

  void _saveProgress() {
    if (_controller.value.isInitialized) {
      final currentPosition = _controller.value.position.inSeconds;
      widget.onProgressSave?.call(currentPosition);
      debugPrint('💾 Progress saved: $currentPosition seconds');
    }
  }

  @override
  void dispose() {
    _saveProgress();
    _progressSaveTimer?.cancel();
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: FlickVideoWithControls(
        playerLoadingFallback: Stack(
          children: [
            Center(
              child: CircularProgressIndicator(color: AppColors.brandPrimary),
            ),
          ],
        ),
        playerErrorFallback: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_controller.value.errorDescription ?? ""),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              left: 20,
              child: FlickAutoHideChild(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Color(0xff1b1b1b).withAlpha(128),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: CustomSvg(asset: "assets/icons/back.svg"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        controls: CustomFlickPortraitControls(),
      ),
      flickVideoWithControlsFullscreen: FlickVideoWithControls(
        videoFit: BoxFit.contain,
        controls: CustomFlickLandscapeControls(),
      ),
    );
  }
}
