import 'package:flutter/material.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/saved_videos_card.dart';

class SavedVideos extends StatelessWidget {
  const SavedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Order History"),
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewPadding.bottom + 4,
        ),
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => SavedVideosCard(),
      ),
    );
  }
}
