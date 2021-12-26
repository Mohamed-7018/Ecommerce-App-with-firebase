import 'package:flutter/material.dart';

class InfoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 30,
          onPressed: () => Navigator.of(context).pop(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0).copyWith(top: 30),
          child: Hero(
            tag: 'pixelsAbout',
            transitionOnUserGestures: true,
            child: Image.asset(
              'assets/images/1.png',
              width:
              (size.height > 700) ? size.height * 0.17 : size.height * 0.14,
            ),
          ),
        ),
        IconButton(icon: const SizedBox(), iconSize: 30, onPressed: null),
      ],
    );
  }
}
