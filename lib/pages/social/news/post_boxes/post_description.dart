import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/providers/theme_provider.dart';

class PostDescription extends StatefulWidget {
  final String description;

  const PostDescription({Key key, this.description}) : super(key: key);

  @override
  _PostDescriptionState createState() => _PostDescriptionState();
}

class _PostDescriptionState extends State<PostDescription>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            vsync: this,
            duration: const Duration(milliseconds: 500),
            child: ConstrainedBox(
              constraints: isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 50.0),
              child: AutoDirection(
                text: widget.description,
                child: LinkWell(
                  widget.description,
                  style: TextStyle(
                    color: theme.theme? Colors.black : Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                  linkStyle: TextStyle(
                    height: 1.5,
                    color: Colors.blue[300],
                    decoration: TextDecoration.underline,
                  ),
                  // textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          isExpanded
              ? ConstrainedBox(constraints: new BoxConstraints())
              : TextButton(
                  child: const Text('...'),
                  onPressed: () => setState(() => isExpanded = true))
        ],
      ),
    );
  }
}
