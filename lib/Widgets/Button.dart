import 'package:flutter/material.dart';
import 'package:spotify/Constants.dart';

class Button extends StatelessWidget {
  Button({Key key, this.title, this.onPressed, this.height, this.width})
      : super(key: key);
  final String title;

  final Function onPressed;

  final double height;

  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? kSpacingUnit * 4,
      width: height ?? kSpacingUnit * 10,
      decoration: BoxDecoration(
        color: kGreenColor,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Text(
          title,
          style: kBodyTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
