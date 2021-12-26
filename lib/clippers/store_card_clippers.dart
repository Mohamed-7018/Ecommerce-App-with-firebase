/*---------------------------------------------------------------------------------------------*/
/*------------------------------  Home Store Cards Clipper  -----------------------------------*/
/*---------------------------------------------------------------------------------------------*/

import 'package:flutter/material.dart';

class HomeStoreCardsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    var x = size.width;
    var y = size.height;

    path.moveTo(0, y * 0.5);

    path.lineTo(0, y);
    path.lineTo(x, y);
    path.lineTo(x, 53);
    path.arcToPoint(
      Offset(x - 35, 20),
      radius: Radius.circular(25),
      clockwise: false,
    );
    path.lineTo(25, y * 0.4);
    path.arcToPoint(
      Offset(0, y * 0.55),
      radius: Radius.circular(50),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
