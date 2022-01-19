// ignore_for_file: must_be_immutable

import 'package:excelledia/module1/components/imagewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreen extends StatelessWidget {
  String? url;
  FullScreen({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ImageWidget(
          height: Get.height,
          radius: 12,
          url: url.toString(),
          width: Get.width,
        ),
      ),
    ));
  }
}
