

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/pages/online_store/cart.dart';
import 'package:samir_online_store/pages/online_store/consts/my_icons.dart';
import 'package:samir_online_store/pages/online_store/feeds.dart';
import 'package:samir_online_store/pages/online_store/home.dart';
import 'package:samir_online_store/pages/online_store/search.dart';
import 'package:samir_online_store/pages/online_store/user_info.dart';
import 'package:samir_online_store/providers/theme_provider.dart';
import 'package:samir_online_store/widgets/navigation.dart';

import '../../constants.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;


  
  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UserInfo(),
      },
      {
        'page': Search(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor:  !theme.theme?Color(0xFF1A1627) :Constants.kCustomsColor.withOpacity(0.3),
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(
                MyAppIcons.home,
              ),
              activeIcon: Icon(
                MyAppIcons.home,
                color: Constants.kCustomsColor,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(
                MyAppIcons.rss,
              ),
              activeIcon: Icon(
                MyAppIcons.rss,
                color: Colors.deepPurple,
              ),
              title: Text("Feeds")),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(
                MyAppIcons.cart,
              ),
              activeIcon: Icon(
                MyAppIcons.cart,
                color: Colors.indigo,
              ),
              title: Text("Cart")),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(
                MyAppIcons.user,
              ),
              activeIcon: Icon(
                MyAppIcons.user,
                color: Colors.green,
              ),
              title: Text("User"))
        ],
      ),

      // BottomAppBar(
      //    color: Colors.pink[800],
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 0.01,
      //   clipBehavior: Clip.antiAlias,
      //   child: Container(
      //     height: kBottomNavigationBarHeight * 0.98,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         border: Border(
      //           top: BorderSide(
      //             color: Colors.grey,
      //             width: 0.5,
      //           ),
      //         ),
      //       ),
      //       child: BottomNavigationBar(
      //         onTap: _selectPage,
      //         backgroundColor: Theme.of(context).primaryColor,
      //         // ignore: deprecated_member_use
      //         unselectedItemColor: Theme.of(context).textSelectionColor,
      //         selectedItemColor: Colors.purple,
      //         currentIndex: _selectedPageIndex,
      //         items: [
      //           BottomNavigationBarItem(
      //             icon: Icon(MyAppIcons.home),
      //             // ignore: deprecated_member_use
      //             title: Text('Home'),
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(MyAppIcons.rss),
      //             // ignore: deprecated_member_use
      //             title: Text('Feeds'),
      //           ),
      //           BottomNavigationBarItem(
      //             activeIcon: null,
      //             icon: Icon(null),
      //             // ignore: deprecated_member_use
      //             title: Text('Search'),
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(
      //               MyAppIcons.bag,
      //             ),
      //             // ignore: deprecated_member_use
      //             title: Text('Cart'),
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(MyAppIcons.user),
      //             // ignore: deprecated_member_use
      //             title: Text('User'),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          // backgroundColor: Colors.purple,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () {
            circularNavigate(
              context,
              page: Search(),
              offset: Offset(MediaQuery.of(context).size.width-50, MediaQuery.of(context).size.height - 70),
            );
          }
        ),
      ),
    );
  }
}
