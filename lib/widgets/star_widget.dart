import 'dart:math';
import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final double size;

  const StarWidget({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: -(pi * 35) / 360,
          child: ClipPath(
            clipper: StarClipper(5),
            child: Container(
              width: size,
              height: size,
              color: Colors.amber[800],
              alignment: Alignment.center,
            ),
          ),
        ),
        Text(
          'NF',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}




class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  ///The number of points of the star
  final int numberOfPoints;

  @override
  Path getClip(Size size) {
    double width = size.height;

    double halfWidth = width / 2;

    double bigRadius = halfWidth;

    double radius = halfWidth / 2;

    double degreesPerStep = _degToRad(360 / numberOfPoints) as double;

    double halfDegreesPerStep = degreesPerStep / 2;

    var path = Path();

    double max = 2 * pi;

    path.moveTo(width, halfWidth);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(
          halfWidth + bigRadius * cos(step), halfWidth + bigRadius * sin(step));
      path.lineTo(halfWidth + radius * cos(step + halfDegreesPerStep),
          halfWidth + radius * sin(step + halfDegreesPerStep));
    }

    path.close();
    return path;
  }

  num _degToRad(num deg) => deg * (pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints;
  }
}
