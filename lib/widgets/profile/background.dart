import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final bool hasImage;
  final String image;
  final Color color;
  final double height;

  BackgroundWidget({
    this.hasImage = true,
    this.color,
    this.height,
    this.image,
  }) : assert(hasImage != null),
        assert(color == null || image == null,
        'Cannot provide both a color and a image'
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.height ,
//      decoration: hasImage
//          ? BoxDecoration(
//        image: DecorationImage(
//          image: image,
//          fit: BoxFit.cover,
//        ),
//      )
//          : BoxDecoration(color: color),

    child:  FadeInImage.assetNetwork(
      fadeInCurve: Curves.bounceInOut,
      fit: BoxFit.cover,
        placeholder: 'assets/gif/loading.gif' ,
        image: image),
    );
  }
}
