
import 'package:flutter/material.dart';
import 'package:samir_online_store/widgets/color_loader.dart';


import 'package:flutter/cupertino.dart';

import 'home/home_header.dart';


class LoadingPage extends StatelessWidget {

  final colorLoader;

  const LoadingPage({Key key, this.colorLoader = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: HomeLogo()
            ),
            //HeaderBox(color: Colors.transparent),
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              child: Image.asset(
                  "assets/gif/loading.gif"
              ),
            ),
            ColorLoader()
          ],
        ),
      ),
    );
  }
}
