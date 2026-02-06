import 'package:flutter/material.dart';

class CliclableObject {
  String title;
  String assetName;
  Widget? page;
  void Function()? callBack;

  CliclableObject({
    required this.title,
    required this.assetName,
    this.page,
    this.callBack,
  });
}
