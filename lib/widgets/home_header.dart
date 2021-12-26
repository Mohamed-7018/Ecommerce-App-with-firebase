
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';



class HeaderBox extends StatelessWidget {
  final Color color;

  HeaderBox ({@required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height > 600) ? 80 : 60,
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      //padding: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
          border: Border.all(color:color, width: 3),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          color: color
      ),
      child : AnimatedText(
        alignment: Alignment.center,
        speed: Duration(milliseconds: 1000),
        controller: AnimatedTextController.loop,
        displayTime: Duration(milliseconds: 1000),
        wordList: ['Kheir', 'And Baraka.', '& New.', 'woman.'],
        textStyle:GoogleFonts.cookie(
          color: Constants.color2,
          fontSize: 25,
        ),
        onAnimate: (index) {
          //print("Animating index:" + index.toString());
        },
        onFinished: () {
          //print("Animtion finished");
        },
      ),

//      WavyAnimatedTextKit(
//        pause: const Duration(milliseconds: 2000),
//        text: ['New Folder', 'The Future is Now'],
//        textStyle: GoogleFonts.changa(
//            fontSize: Theme.of(context).textTheme.headline6.fontSize,
//            // fontWeight: FontWeight.bold,
//            letterSpacing: 1.5,
//            wordSpacing: 2,
//            color: color ==Colors.white ? Colors.white :Colors.white
//        ),
//        textAlign: TextAlign.center,
//      ),
    );
  }
}