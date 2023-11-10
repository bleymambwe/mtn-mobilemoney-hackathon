import 'package:flutter/material.dart';

final Color mainColor = Colors.amber.shade400; //Color(0xFFFC0);

const String mainFont = 'MTNBrighterSans';

const FontWeight lightFont = FontWeight.w100;
const FontWeight mediumFont = FontWeight.w400;
const FontWeight boldFont = FontWeight.w800;

const primaryFont = lightFont;
const double primaryFontSize = 20;
const double secondaryFontSize = 30;

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color backgroundColor;
  final double borderRadius;
  final double depth;

  NeumorphicContainer({
    required this.child,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.amber,
    this.borderRadius = 12.0,
    this.depth = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -depth,
            blurRadius: depth,
            offset: Offset(-depth, -depth),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: -depth,
            blurRadius: depth,
            offset: Offset(depth, depth),
          ),
        ],
      ),
      child: child,
    );
  }
}
