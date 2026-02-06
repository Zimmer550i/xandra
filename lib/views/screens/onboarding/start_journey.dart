import 'package:flutter/material.dart';

class StartJourney extends StatelessWidget {
  const StartJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/onboarding_01.png")
        ],
      ),
    );
  }
}