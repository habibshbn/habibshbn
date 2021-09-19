import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/Constants.dart';

class ShuffleButton extends StatelessWidget {
  ShuffleButton({Key key, this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kSpacingUnit * 1.2,
        width: kSpacingUnit * 1.6,
        decoration: BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: SvgPicture.asset('assets/icons/shuffle.svg'),
        ),
      ),
    );
  }
}
