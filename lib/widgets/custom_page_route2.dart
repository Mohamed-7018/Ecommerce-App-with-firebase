import 'dart:math';

import 'package:flutter/material.dart';


//*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Navigate Function  ----------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  windowNavigateToPage(BuildContext context , {Widget page}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          double beginRadius = 0.0;
          double endRadius = 1.0;
          var radiusTween = Tween(begin: beginRadius, end: endRadius);
          var radiusTweenAnimation = animation.drive(radiusTween);
          return ClipPath(
            clipper: IndicatorPageRouteClipper(
              radiusTweenAnimation.value,
            ),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
    );
  }


/*-----------------------------------------------------------------------------------------------------*/
/*-------------------------------------------  Page Clipper  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
class IndicatorPageRouteClipper extends CustomClipper<Path> {
  final double radius;

  IndicatorPageRouteClipper(this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width * 2,
            height: size.height * 2),
        -pi / 2,
        2 * pi * radius);

    path.lineTo(size.width / 2, size.height / 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
