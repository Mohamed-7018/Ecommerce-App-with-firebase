import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  CurvedContainer({
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.decoration,
    this.child,
    this.margin,
    this.topLeftRadius =0.0,
    this.topRightRadius = 0.0,
    this.bottomRightRadius = 0.0,
    this.bottomLeftRadius =0.0,
    this.boxShadow,
  });

  final double height;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final BoxDecoration decoration;
  final Widget child;
  final EdgeInsetsGeometry margin;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
//      height: height //?? assignHeight(context: context, fraction: 0.15),
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius ??
                BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius),
                  topRight: Radius.circular(topRightRadius),
                  bottomRight: Radius.circular(bottomRightRadius),
                  bottomLeft: Radius.circular(bottomLeftRadius),
                ),
            boxShadow: boxShadow,
          ),
      child: child,
    );
  }
}
