
import 'package:flutter/material.dart';
import 'package:samir_online_store/widgets/social/custom_bottom_navigation_bar.dart';
import 'package:samir_online_store/widgets/social/social_nav_bar.dart';

import 'email_sender/email_sender.dart';
import 'info/our_social_media.dart';
import 'news/news_page.dart';

class NavBarHome extends StatelessWidget {
  static String routeName ="socialNavBar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          NewsPage(),
          MailFormStepper(),
          OurSocialMedia(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
