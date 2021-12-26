import 'package:flutter/material.dart';


class ActionIcon extends StatelessWidget {
  ActionIcon({
    this.iconData,
    this.color = const Color(0xFFA1A1A1),
    this.title,
    this.size,
    this.hasTitle = true,
    this.isHorizontal = false,
    this.titleStyle,
    this.onTap,
  }) : assert(hasTitle == false || title != null);

  final IconData iconData;
  final double size;
  final Color color;
  final String title;
  final TextStyle titleStyle;
  final bool hasTitle;
  final bool isHorizontal;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: !isHorizontal
          ? Column(
        children: [
          Icon(
            iconData,
            size: size,
            color: color,
          ),
          hasTitle ? SizedBox(
            height: 8.0,
          ) : Container(),
          hasTitle
              ? Text(
            title,
            style: titleStyle ??
                theme.textTheme.bodyText1.copyWith(
                    color:Color(0xFFA1A1A1),
                    fontSize:  14.0),
          )
              : Container()
        ],
      )
          : Row(
        children: [
          hasTitle
              ? Text(
            title,
            style: titleStyle ??
                theme.textTheme.bodyText1.copyWith(
                    color:Color(0xFFA1A1A1),
                    fontSize: 14.0),
          )
              : Container(),
          hasTitle ? SizedBox(
            width: 4.0,
          ) : Container(),
          Icon(
            iconData,
            size: size,
            color: color,
          ),
        ],
      ),
    );
  }
}
