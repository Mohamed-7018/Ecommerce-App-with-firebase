import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:samir_online_store/widgets/animated_text_header.dart';
import 'package:samir_online_store/widgets/blur_filter.dart';
import 'package:samir_online_store/widgets/social/action_icon.dart';

import '../../../../../constants.dart';
import 'info_header.dart';



class OurSocialMedia extends StatefulWidget {
  final isHome;

  const OurSocialMedia({Key key, this.isHome=false}) : super(key: key);

  @override
  _OurSocialMediaState createState() => _OurSocialMediaState();
}

class _OurSocialMediaState extends State<OurSocialMedia>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation1, animation2;

  @override
  void initState() {
    super.initState();


    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3500))
      ..forward();

    animation1 = Tween<Offset>(begin: Offset(-1.7, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeInOutQuad)));

    animation2 = Tween<Offset>(begin: Offset(-1.7, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.15, 0.45, curve: Curves.easeInOutQuad)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
/*---------------------------------------------------------------------------------------*/
/*------------------------------------  NF Logo  ------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                widget.isHome == false ? InfoHeader() : Container(),

                const SizedBox(height: 10),
                _contact(context),
                SizedBox(height: (size.height > 600) ? 30 : 20),
                SizedBox(
                  height: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _contact(BuildContext context) {
    return BlurFilter(
      sigma: 5.0,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.pink[700], width: 2),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
          //color: Colors.white.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              AnimatedTextHeader(
                isSocial: false,
              ),
              _buildOptionIcons(context: context),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionIcons({@required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: animation1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionIcon(
                    onTap: () {
                      Constants.launchUniversalLink(Constants.githubLink);
                    },

                    //---------------------Message function ---------------/
                    // async {
                    //   // Android
                    //   const uri = 'sms:+39 348 060 888?body=hello%20there';
                    //   if (await canLaunch(uri)) {
                    //     await launch(uri);
                    //   } else {
                    //     // iOS
                    //     const uri = 'sms:0039-222-060-888?body=hello%20there';
                    //     if (await canLaunch(uri)) {
                    //       await launch(uri);
                    //     } else {
                    //       throw 'Could not launch $uri';
                    //     }
                    //   }
                    // },
                    title: "github",
                    iconData: FeatherIcons.github,
                    color: Color(0xFF9599B3),
                  ),
                  Spacer(),
                  ActionIcon(
                    onTap: () {
                      Constants.launchUniversalLink(Constants.websiteLink);
                    },
                    title: "HackerRank",
                    iconData: FeatherIcons.code,
                    color: Color(0xFF817889),
                  ),
                  Spacer(),
                  ActionIcon(
                    onTap: () {
                      Constants.launchUniversalLink(Constants.linkedInLink);
                    },
                    title: "LinkedIn",
                    iconData: FeatherIcons.linkedin,
                    color: Color(0xFFD47FA6),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.greenAccent,
          height: 24.0,
        ),
        SlideTransition(
          position: animation2,
          child: Container(
            //height: height * 0.15,
            decoration: BoxDecoration(
              color: Colors.pink[800].withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionIcon(
                    onTap: () {
                      Constants.launchUniversalLink(Constants.facebookLink);
                    },
                    title: "Facebook",
                    iconData: FeatherIcons.facebook,
                    color: Color(0xFF8856AC),
                  ),
                  Spacer(),
                  ActionIcon(
                    onTap: () {
                      Constants.launchUniversalLink(Constants.twitterLink);
                    },
                    title: 'twitter',
                    iconData: FeatherIcons.twitter,
                    color: Color(0xFFD47FA6),
                  ),
                  Spacer(),
                  ActionIcon(
                    onTap: () {
                      Constants.launchUniversalLink(Constants.instagramLink);
                    },
                    title: "Instagram",
                    iconData: FeatherIcons.instagram,
                    color: Color(0xFF8856AC),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
