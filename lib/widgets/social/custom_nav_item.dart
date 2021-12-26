import 'package:flutter/material.dart';
import 'social_nav_bar.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;

  const CustomNavItem({this.setPage, this.icon, this.id});

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentIndex = id;
        setPage();
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor:Colors.indigo[800],
        child: CircleAvatar(
          radius: 25,
          backgroundColor: currentIndex == id
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          child: Icon(
            icon,
            color: currentIndex == id
                ? Colors.black
                : Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
