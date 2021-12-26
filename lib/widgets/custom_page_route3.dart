import 'dart:math';

import 'package:flutter/material.dart';

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Navigate Function  ----------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  doorNavigateToPage(BuildContext context, {Widget  page , exitPage}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Container(
           // color: backgroundColor,
            child: Stack(
              children: <Widget>[
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(-1.0, 0.0),
                  ).animate(animation),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..rotateY(pi / 2 * animation.value),
                    alignment: FractionalOffset.centerRight,
                    child: exitPage,
                  ),
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..rotateY(pi / 2 * (animation.value - 1)),
                    alignment: FractionalOffset.centerLeft,
                    child: page,
                  ),
                )
              ],
            ),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
    );
  }
//}
