import 'package:flutter/material.dart';
import 'package:samir_online_store/widgets/blur_filter.dart';

class PostBtn extends StatelessWidget {
  final Function onClick;
  final IconData icon;

  const PostBtn({
    Key key,
    this.onClick,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlurFilter(
        sigma: 5.0,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.pink[700], width: 2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
          child: Icon(icon),
          onPressed: onClick,
        ),
      ),
    );
  }
}
