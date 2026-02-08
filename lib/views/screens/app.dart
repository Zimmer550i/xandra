import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/views/base/custom_bottom_navbar.dart';
import 'package:xandra/views/screens/cart/cart.dart';
import 'package:xandra/views/screens/explore/explore.dart';
import 'package:xandra/views/screens/home/home.dart';
import 'package:xandra/views/screens/profile/profile.dart';
import 'package:xandra/views/screens/try_on/try_on.dart';

final GlobalKey<AppState> appKey = GlobalKey<AppState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  int index = 0;

  void setIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  List<Widget> pages = [
    Home(),
    FlutterLogo(size: 100),
    Explore(),
    Cart(),
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
                  Get.to(() => TryOn(tryOnType: TryOnType.findProduct,));
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
