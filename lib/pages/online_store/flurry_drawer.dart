import 'package:flutter/material.dart';
import 'package:samir_online_store/constants.dart';
import 'package:samir_online_store/pages/online_store/bottom_section/bottom_section.dart';
import 'package:samir_online_store/pages/online_store/drawer_pages/add_product_screen.dart';
import 'package:samir_online_store/widgets/flurry_drawer/flurry_menu.dart';
import 'package:samir_online_store/widgets/flurry_drawer/flurry_navigation.dart';

import 'drawer_pages/fifth_screen.dart';
import 'drawer_pages/first_screen.dart';
import 'drawer_pages/fourth_screen.dart';
import 'drawer_pages/mail.dart';
import 'drawer_pages/second_screen.dart';
import 'drawer_pages/third_screen.dart';





class MyFlurryHomePage extends StatefulWidget {
  @override
  _MyFlurryHomePageState createState() => new _MyFlurryHomePageState();
}
class _MyFlurryHomePageState extends State<MyFlurryHomePage> {
  //Decalre active screen var with the the default screen somewhere accesible to the contentScreen attributes
  var activeScreen = firstscreen;
  Widget build(BuildContext context) {
    return SafeArea(
      child: new FlurryNavigation(

        // The curve of the screen (Double)
        curveRadius: (MediaQuery.of(context).size.width *
            MediaQuery.of(context).size.height) /
            4980,
        // The Icon data of the icon the BottomLeft
        expandIcon: Image.asset("assets/images/list_black.png") ,
        // The size of the icon on the BottomLeft
        iconSize: ((MediaQuery.of(context).size.width *
            MediaQuery.of(context).size.height) /
            15420) ,
        // The content of the screen
        contentScreen: activeScreen,
        menuScreen: new MenuScreen(
          bottomSection: BottomSection(),
          // bottomSection: BottomSection(),
          bgColor: Color.fromRGBO(121, 134, 203, 1),
          menu: new Menu(
            items: [
              new MenuItem(
                id:
                'hom', //You can set this to whatever you want but dont duplicate it
                icon:
                'assets/hom.png', //Set this to the data for the icon of the button
                isSelected: true,
                selectedBtnColor: Constants.color2,
                // btnShape: BoxShape.rectangle
              ),
              new MenuItem(
                id : 'add',
                icon: 'assets/images/add.png',
                isSelected: false,
                selectedBtnColor: Constants.color2,
              ),
              new MenuItem(
                id: 'wish',
                icon: 'assets/images/wish.png',
                isSelected: false,
                selectedBtnColor: Constants.color2,
                //btnShape: BoxShape.rectangle
              ),
              new MenuItem(
                id: 'order',
                icon: 'assets/orders.png',
                isSelected: false,
                selectedBtnColor: Constants.color2,
                //btnShape: BoxShape.rectangle
              ),
              new MenuItem(
                id: 'mail',
                icon: 'assets/images/mail.png',
                isSelected: false,
                selectedBtnColor: Constants.color2,
              ),
              new MenuItem(
                id: 'about',
                icon: 'assets/images/about.png',
                isSelected: false,
                selectedBtnColor: Constants.color2,
              ),
              new MenuItem(
                id: "rate",
                icon: "assets/images/rate.png",
                isSelected: false,
                selectedBtnColor: Constants.color2,
              )
            ],
          ),
          onMenuItemSelected: (String itemId) {
            if (itemId == 'hom') {
              setState(() => activeScreen = firstscreen);
            } else if (itemId == 'order') {
              setState(() => activeScreen = secondscreen);
            } else if (itemId == 'mail') {
              setState(() => activeScreen = thirdscreen);
            } else if (itemId == 'about') {
              setState(() => activeScreen = fourthscreen);
            } else if (itemId == 'wish') {
              setState(() => activeScreen = fifthscreen);
            } else if (itemId == "rate") {
              setState(() => activeScreen = mailScreen);
            }else if (itemId =="add") {
              setState(() => activeScreen = addProductScreen);
            }
          },
        ),
      ),
    );
  }
}
