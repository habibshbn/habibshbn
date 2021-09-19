import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotify/Controllers/HomeController.dart';
import 'package:spotify/Constants.dart';

class SpSlider extends StatelessWidget {
  SpSlider({Key key, this.value}) : super(key: key);
  final double value;
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Container(
            height: 4.w,
            width: double.infinity,
            child: Slider.adaptive(
                activeColor: Colors.blue[800],
                inactiveColor: Colors.grey[350],
                value: homeController.position.value.inSeconds.toDouble(),
                max: homeController.musicLength.value.inSeconds.toDouble(),
                onChanged: (value) {
                  print(value);
                  homeController.seekToSec(value.toInt());
                }),
          ),
        ),
        SizedBox(height: kSpacingUnit),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${homeController.position.value.inMinutes}:${homeController.position.value.inSeconds.remainder(60)}',
                style: kCaptionTextStyle,
              ),
              Text(
                '${homeController.musicLength.value.inMinutes}:${homeController.musicLength.value.inSeconds.remainder(60)}',
                style: kCaptionTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
