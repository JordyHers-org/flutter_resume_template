import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class Config {
  static double smallHeight = 250.0;
  static double mediumHeight = 500.0;
  static double largeHeight = 800.0;

  static double smallWidth = 150.0;
  static double mediumWidth = 250.0;
  static double largeWidth = 400.0;

  static double smallSpacer = 15.0;
  static double mediumSpacer = 25.0;
  static double largeSpacer = 45.0;

  static double fortyPx = 40.0;
  static double tenPx = 10.0;
  static double eightPx = 8.0;
  static double sixPx = 6.0;
  static double fourPx = 4.0;
  static double threePx = 3.0;
  static double twoPx = 2.0;
  static double onePx = 1.0;
  static double oneHalfPx = 0.5;
  static double oPx = 0.0;

  static final shakingConstant = ShakeSlowConstant1();

  static const shakingDuration = Duration(seconds: 5);

  static spaceBox(double height) => SizedBox(
        height: height,
      );

  static dynamicHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static dynamicWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static EdgeInsetsGeometry margin = EdgeInsets.all(tenPx);

  static Padding padding = Padding(
    padding: EdgeInsets.all(tenPx),
  );

  static Padding dtVertPad = Padding(
    padding: EdgeInsets.symmetric(vertical: tenPx),
  );

  static Padding dtHorPad = Padding(
    padding: EdgeInsets.symmetric(horizontal: tenPx),
  );

  static Decoration shakingBox() => BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(
          width: 0.2,
          color: Colors.grey.shade400,
        ),
      );

  static Decoration decoration(BuildContext context, {Color? color}) =>
      BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(twoPx / 10),
            spreadRadius: sixPx,
            blurRadius: eightPx,
            offset: Offset(oPx, fourPx), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(eightPx),
        ),
        border: Border.all(
          style: BorderStyle.none,
        ),
      );
}
