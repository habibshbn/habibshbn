import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotify/Controllers/HomeController.dart';
import 'package:spotify/Constants.dart';

class SongController extends StatelessWidget {
  SongController({Key key}) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/next.svg',
          height: 18.sp,
          width: 18.sp,
        ),
        SizedBox(width: kSpacingUnit * 3),
        Container(
          height: kSpacingUnit * 7,
          width: kSpacingUnit * 7,
          decoration: BoxDecoration(
            color: kTextColor,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {
              if (homeController.playing.isTrue) {
                homeController.advancedPlayer.pause();
                homeController.playing.value = false;
              } else {
                homeController.play();
                homeController.playing.value = true;
              }
            },
            child: Obx(
              () => Center(
                child: homeController.playing.value
                    ? Icon(
                        Icons.pause,
                        size: 24.sp,
                      )
                    : SvgPicture.asset(
                        'assets/icons/play.svg',
                        height: 24.sp,
                        width: 24.sp,
                        color: kBlackColor,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(width: kSpacingUnit * 3),
        SvgPicture.asset(
          'assets/icons/back.svg',
          height: 18.sp,
          width: 18.sp,
        ),
      ],
    );
  }
}
