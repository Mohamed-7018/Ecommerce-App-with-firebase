import 'package:flutter/material.dart';


circularNavigate(BuildContext context, {Widget page, Offset offset}) {
  var height = MediaQuery.of(context).size.height;
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
        double beginRadius = 0.0;
        double endRadius = height * 1.3;
        var radiusTween = Tween(begin: beginRadius, end: endRadius);
        var radiusTweenAnimation = animation.drive(radiusTween);
        return ClipPath(
          clipper: CirclePageRouteClipper(radiusTweenAnimation.value, offset),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => page,
    ),
  );
}



/*----------------------------------------------  Circular Page Route  ----------------------------------------------*/

class CirclePageRouteClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  CirclePageRouteClipper(this.radius, this.center);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
