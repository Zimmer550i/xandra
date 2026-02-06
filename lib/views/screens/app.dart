import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/views/base/custom_bottom_navbar.dart';
import 'package:xandra/views/screens/home/home.dart';
import 'package:xandra/views/screens/profile/profile.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  List<Widget> pages = [
    Home(),
    FlutterLogo(size: 100),
    FlutterLogo(size: 150),
    FlutterLogo(size: 200),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: pages[index]),
          Positioned(
            bottom: 8 + MediaQuery.of(context).viewPadding.bottom,
            left: 20,
            right: 20,
            child: CustomBottomNavbar(
              index: index,
              onChanged: (val) {
                if (val == 1) {
                  Get.find<ThemeController>().toggleTheme();
                  return;
                }
                setState(() {
                  index = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
