import 'package:flutter/material.dart';
import 'package:xandra/utils/app_constants.dart';
import 'package:xandra/views/base/video_widget.dart';

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
              itemCount: AppConstants.videos.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: VideoWidget(
                        AppConstants.videos[index]['sources'].first,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
